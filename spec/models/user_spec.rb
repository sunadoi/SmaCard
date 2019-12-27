require 'rails_helper'

describe User do
  describe '#create' do
    context 'can save' do
      it "is valid with a name, email, password, password_confirmation, tel" do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without a name" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end

      it "is invalid without a email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "is invalid with a duplicate email" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end

      it "is invalid without a password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "is invalid without a password_confirmation although with a password" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it "is invalid without a tel" do
        user = build(:user, tel: "")
        user.valid?
        expect(user.errors[:tel]).to include("を入力してください")
      end

      it "is invalid with a duplicate tel" do
        user = create(:user)
        another_user = build(:user, tel: user.tel)
        another_user.valid?
        expect(another_user.errors[:tel]).to include("はすでに存在します")
      end

    end
  end
end