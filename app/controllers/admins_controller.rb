class AdminsController < ApplicationController
  def edit
    @card = Card.find(params[:card_id])
  end
end
