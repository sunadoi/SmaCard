class Card < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  belongs_to :relation
  belongs_to :card_list, optional: true
  has_many :cards_benefits, dependent: :destroy
  has_many :benefits, through: :cards_benefits
  has_many :cards_coupons, dependent: :destroy
  has_many :coupons, through: :cards_coupons

  def self.search(keyword)
    return CardList.all unless keyword
    @relations = Relation.where('name LIKE(?)', "%#{keyword}%")

    ids = []
    @relations.each do |relation|
      ids << relation.card_list_id
    end
    CardList.where(id: ids)
  end
end
