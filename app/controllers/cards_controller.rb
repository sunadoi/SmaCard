class CardsController < ApplicationController
  before_action :ensure_login, except: [:top]

  def top
  end

  def index
    @cards = Card.includes(:user)
  end

  def new
    @relations = Relation.all
    @cards = CardList.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)
  end

  private
  def card_params
    params.require(:card).permit(:point, :user_id, :admin_id, :relation_id)
  end

end