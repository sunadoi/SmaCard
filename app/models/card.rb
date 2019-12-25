class Card < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  belongs_to :relation
  belongs_to :card_list, optional: true
  has_many :cards_benefits, dependent: :destroy
  has_many :benefits, through: :cards_benefits
  has_many :cards_coupons, dependent: :destroy
  has_many :coupons, through: :cards_coupons
end
