class Relation < ApplicationRecord
  belongs_to :admin
  belongs_to :card_list
  has_many :cards

  validates :name, :location, :opening_time, :closing_time, :image, presence: true

  mount_uploader :image, ImageUploader
end
