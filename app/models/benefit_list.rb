class BenefitList < ApplicationRecord
  belongs_to :card_list
  has_many :benefits
end
