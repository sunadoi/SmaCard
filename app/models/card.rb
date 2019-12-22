class Card < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  belongs_to :relation
  has_many :benefits, optional: true
  has_many :coupons, optional: true
end
