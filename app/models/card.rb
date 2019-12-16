class Card < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  belongs_to :relation
end
