class BenefitList < ApplicationRecord
  belongs_to :card_list, optional: true
  has_many :benefits
end
