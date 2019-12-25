class Benefit < ApplicationRecord
  belongs_to :benefit_list
  has_many :cards_benefits, dependent: :delete_all
  has_many :cards, through: :cards_benefits
end
