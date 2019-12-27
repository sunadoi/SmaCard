class BenefitListsController < ApplicationController
  before_action :set_benefit, only: [:edit, :update, :destroy]

  def new
    @benefit_list = BenefitList.new
  end

  def create
    @benefit_list = BenefitList.create(benefit_list_params)
    @benefit = Benefit.create(benefit_list_id: @benefit_list.id)
    @cards = Card.where(card_list_id: @benefit_list.card_list_id)
    @cards.each do |card|
      @cards_benefits = CardsBenefit.create(card_id: card.id, benefit_id: @benefit.id)
    end
    flash[:notice] = "特典を追加しました"
    redirect_to admin_card_list_index_path(current_admin.id)
  end

  def edit
  end

  def update
    if @benefit_list.update(benefit_list_params)
      flash[:notice] = "特典情報を変更しました"
      redirect_to admin_card_list_index_path(current_admin.id)
    else
      flash.now[:alert] = '特典内容をを入力してください。'
      render action: :edit
    end
  end

  def destroy
    @benefit_list.destroy
    flash[:notice] = "特典情報を削除しました"
    redirect_to admin_card_list_index_path(current_admin.id)
  end

  private

  def set_benefit
    @benefit_list = BenefitList.find(params[:id].to_i)
  end

  def benefit_list_params
    params.permit(:description).merge(card_list_id: current_admin.card_list.id)
  end
end
