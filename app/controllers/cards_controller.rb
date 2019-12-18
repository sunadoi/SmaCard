class CardsController < ApplicationController
  def top
  end

  def index
    @cards = Card.includes(:user)
  end
end
