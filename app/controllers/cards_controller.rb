class CardsController < ApplicationController
  before_action :ensure_login, except: [:top]
  before_action :set_card, only: [:show, :edit, :update, :destroy]

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
  end

  def create
    @card_list = CardList.find(params[:card_list_id])
    @card = @card_list.cards.create(admin_id: @card_list.admin_id, relation_id: @card_list.relation.id, user_id: current_user.id)

    if benefit_params.present?
      benefit_lists = []
      @benefit_lists = benefit_params.keys.each do |id|
        benefit_lists << BenefitList.find(id)
      end
      benefit_lists.each do |benefit_list|
        @benefit = Benefit.create(benefit_list_id: benefit_list.id)
        @cards_benefits = CardsBenefit.create(card_id: @card.id, benefit_id: @benefit.id)
      end
    end

    if coupon_params.present?
      coupon_lists = []
      @coupon_lists = coupon_params.keys.each do |id|
        coupon_lists << CouponList.find(id)
      end
      coupon_lists.each do |coupon_list|
        @coupon = Coupon.create(coupon_list_id: coupon_list.id)
        @cards_coupons = CardsCoupon.create(card_id: @card.id, coupon_id: @coupon.id)
      end
    end

    flash[:notice] = "カードを追加しました"
    redirect_to action: :new
  end

  def show
  end

  def edit
  end

  def update
    @card.update(card_params)
    @benefit = Benefit.find(params[:benefit_id])
    @benefit.update(used_date: params[:benefit_used_date])
    @coupon = Coupon.find(params[:coupon_id])
    @coupon.update(used_date: params[:coupon_used_date])
  end

  def destroy
    @card.destroy
    flash[:alert] = "カードを削除しました"
    redirect_to action: :index
  end

  def search
    @cards = Card.search(params[:keyword])
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.permit(:point, :user_id, :admin_id, :relation_id)
  end

  def benefit_params
    params.permit(benefit_lists: [:benefit_description])[:benefit_lists]
  end

  def coupon_params
    params.permit(coupon_lists: [:coupon_description, :expiration])[:coupon_lists]
  end

end