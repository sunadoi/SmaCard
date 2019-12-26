class Relation < ApplicationRecord
  has_one :admin
  belongs_to :card_list
  has_many :cards

  validates :location, :opening_time, :closing_time, :image, presence: true
  validates :name, :tel, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader
end
