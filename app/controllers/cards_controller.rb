class CardsController < ApplicationController
  def top
  end

  def index
    @cards = Card.includes(:user)
  end

  def show
  end

  def update
    @card = Card.find(params[:id])
    # @card.point = params[:card][:point]
    # @card.save
    @card.update(card_params)
  end

  private
  def card_params
    params.require(:card).permit(:point, :user_id, :admin_id, :relation_id)
  end

end