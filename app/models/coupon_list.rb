class CouponList < ApplicationRecord
  belongs_to :card_list
  has_many :coupons

  validates :description, presence: true
end
