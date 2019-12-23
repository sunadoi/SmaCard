class Card < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  belongs_to :relation
  belongs_to :card_list
  has_many :cards_benefits
  has_many :benefits, through: :cards_benefits
  has_many :cards_coupons
  has_many :coupons, through: :cards_coupons
end
