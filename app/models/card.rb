class Card < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  belongs_to :relation
  belongs_to :card_list, optional: true
  has_many :cards_benefits, dependent: :delete_all
  has_many :benefits, through: :cards_benefits
  has_many :cards_coupons, dependent: :delete_all
  has_many :coupons, through: :cards_coupons
end
