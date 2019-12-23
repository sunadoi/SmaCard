class Coupon < ApplicationRecord
  belongs_to :coupon_list
  has_many :cards_coupons
  has_many :cards, through: :cards_coupons
end
