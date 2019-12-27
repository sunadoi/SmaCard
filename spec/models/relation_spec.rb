require 'rails_helper'

describe Relation do
  describe '#create' do

    context 'can save' do
      it "is valid with name, location, opening_time, closing_time, tel, image" do
        relation = build(:relation)
        expect(relation).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without a name" do
        relation = build(:relation, name: "")
        relation.valid?
        expect(relation.errors[:name]).to include("を入力してください")
      end

      it "is invalid with a duplicate name" do
        relation = create(:relation)
        another_relation = build(:relation, name: relation.name)
        another_relation.valid?
        expect(another_relation.errors[:name]).to include("はすでに存在します")
      end

      it "is invalid without a location" do
        relation = build(:relation, location: "")
        relation.valid?
        expect(relation.errors[:location]).to include("を入力してください")
      end

      it "is invalid without a opening_time" do
        relation = build(:relation, opening_time: nil)
        relation.valid?
        expect(relation.errors[:opening_time]).to include("を入力してください")
      end

      it "is invalid without a closing_time" do
        relation = build(:relation, closing_time: nil)
        relation.valid?
        expect(relation.errors[:closing_time]).to include("を入力してください")
      end

      it "is invalid without a tel" do
        relation = build(:relation, tel: "")
        relation.valid?
        expect(relation.errors[:tel]).to include("を入力してください")
      end

      it "is invalid with a duplicate tel" do
        relation = create(:relation)
        another_relation = build(:relation, tel: relation.tel)
        another_relation.valid?
        expect(another_relation.errors[:tel]).to include("はすでに存在します")
      end

      it "is invalid without a image" do
        relation = build(:relation, image: "")
        relation.valid?
        expect(relation.errors[:image]).to include("を入力してください")
      end

    end
  end
end