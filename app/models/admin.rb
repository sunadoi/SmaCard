class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :relation, optional: true
  has_many :cards
  has_one :card_list

  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: true
end
