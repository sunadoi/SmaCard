class CardsCoupon < ApplicationRecord
  belongs_to :card
  belongs_to :coupon
end
