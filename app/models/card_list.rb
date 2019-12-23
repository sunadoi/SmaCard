class CardList < ApplicationRecord
  belongs_to :admin
  has_one :relation
  has_many :cards
  has_many :benefit_lists
  has_many :coupon_lists
end
