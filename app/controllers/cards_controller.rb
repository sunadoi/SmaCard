class CardsController < ApplicationController
  before_action :ensure_login, except: [:top]

  def top
  end

  def index
    @cards = Card.includes(:user)
  end

  def new
    @user_cards = Card.where(user_id: current_user.id)
    @card_lists = CardList.all

    ids = []
    @user_cards.each do |user_card|
      ids << user_card.card_list_id
    end
    rest_ids = @card_lists.ids - ids
    @cards = CardList.where(id: rest_ids)

    @benefit_lists = BenefitList.where(card_list_id: @cards.ids)
  end

  def create
    @card_list = CardList.find(params[:card_list_id])
    @card = Card.create(card_list_id: @card_list.id, admin_id: @card_list.admin_id, relation_id: @card_list.relation.id, user_id: current_user.id)

    benefit_lists = []
    @benefit_lists = benefit_params.keys.each do |id|
      benefit_lists << BenefitList.find(id)
    end
    benefit_lists.each do |benefit_list|
      @benefit = Benefit.create(benefit_list_id: benefit_list.id)
      @cards_benefits = CardsBenefit.create(card_id: @card.id, benefit_id: @benefit.id)
    end
    flash[:notice] = "カードを追加しました"
    redirect_to action: :new
  end

  def show
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    flash[:alert] = "カードを削除しました"
    redirect_to action: :index
  end

  private

  def card_params
    params.require(:card).permit(:point, :user_id, :admin_id, :relation_id)
  end

  def benefit_params
    params.permit(benefit_lists: [:benefit_description])[:benefit_lists]
  end

end