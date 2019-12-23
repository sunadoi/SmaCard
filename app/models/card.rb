class Card < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :admin
  belongs_to :relation
  has_many :benefits
  has_many :coupons
end
