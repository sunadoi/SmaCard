class CardList < ApplicationRecord
  belongs_to :admin
  has_one :relation, dependent: :delete
  has_many :cards, dependent: :destroy
  has_many :benefit_lists, dependent: :destroy
  has_many :coupon_lists, dependent: :destroy
end
