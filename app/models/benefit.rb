class Benefit < ApplicationRecord
  belongs_to :benefit_list
  has_many :cards_benefits
  has_many :cards, through: :cards_benefits
end
