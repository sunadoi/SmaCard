class Relation < ApplicationRecord
  belongs_to :admin
  belongs_to :card_list
  has_many :cards
end
