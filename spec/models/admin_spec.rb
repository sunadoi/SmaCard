require 'rails_helper'

describe Admin do
  describe '#create' do
    
    context 'can save' do
      it "is valid with a name, email, password, password_confirmation" do
        admin = build(:admin)
        expect(admin).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without a name" do
        admin = build(:admin, name: "")
        admin.valid?
        expect(admin.errors[:name]).to include("を入力してください")
      end

      it "is invalid without a email" do
        admin = build(:admin, email: "")
        admin.valid?
        expect(admin.errors[:email]).to include("を入力してください")
      end

      it "is invalid with a duplicate email" do
        admin = create(:admin)
        another_admin = build(:admin, email: admin.email)
        another_admin.valid?
        expect(another_admin.errors[:email]).to include("はすでに存在します")
      end

      it "is invalid without a password" do
        admin = build(:admin, password: "")
        admin.valid?
        expect(admin.errors[:password]).to include("を入力してください")
      end

      it "is invalid without a password_confirmation although with a password" do
        admin = build(:admin, password_confirmation: "")
        admin.valid?
        expect(admin.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
      end

    end
  end
end