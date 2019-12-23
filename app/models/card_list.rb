class CardList < ApplicationRecord
  belongs_to :admin
  belongs_to :relation, optional: true
  has_many :cards
  has_many :benefit_lists
  has_many :coupon_lists
end
