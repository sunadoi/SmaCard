class CardListsController < ApplicationController
  before_action :admin_sign_up, only: [:index]
  before_action :admin_card_list_has?, only: [:new]


  def index
    @card_list = CardList.find_by(admin_id: current_admin.id)
  end

  def show
    @card_list = CardList.find(params[:id])
  end

  def new
    @card_list = CardList.new
    @relation = Relation.new
    @benefit_list = BenefitList.new
    @coupon_list = CouponList.new
  end

  def create
    begin
      Relation.transaction do
        @card_list = CardList.create(admin_id: current_admin.id)
        @relation = Relation.create!(relation_params)
        flash[:notice] = "カードを登録しました"
        redirect_to admin_card_list_index_path(current_admin.id)
      end
    rescue => e 
      @card_list = CardList.new(admin_id: current_admin.id)
      @relation = Relation.new(relation_params)
      @benefit_list = BenefitList.new(benefit_params)
      @coupon_list = CouponList.new(coupon_params)
      flash.now[:alert] = '必要事項を入力してください。'
      render action: :new
    end
  end

  def destroy
    @card_list = CardList.find(params[:id].to_i)
    @card_list.destroy
    flash[:alert] = "カードを削除しました"
    redirect_to action: :new
  end

  private

  def relation_params
    params.require(:relation).permit(:name, :location, :opening_time, :closing_time, :tel, :url, :image).merge(card_list_id: @card_list.id)
  end

  def admin_sign_up
    unless current_admin.card_list
      redirect_to new_admin_card_list_path(current_admin.id)
    end
  end

  def admin_card_list_has?
    if current_admin.card_list
      redirect_to admin_card_list_index_path(current_admin.id)
    end
  end

end
