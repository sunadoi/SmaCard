class CardsBenefit < ApplicationRecord
  belongs_to :card
  belongs_to :benefit, dependent: :destroy
end
