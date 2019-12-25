class AdminsController < ApplicationController
  before_action :ensure_login

  def edit
    @card = Card.find(params[:id])
  end
end
