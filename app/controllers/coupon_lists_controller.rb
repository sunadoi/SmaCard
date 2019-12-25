class CouponListsController < ApplicationController
  before_action :set_coupon, only: [:edit, :update, :destroy]

  def new
    @coupon_list = CouponList.new
  end

  def create
    @coupon_list = CouponList.create(coupon_list_params)
    @coupon = Coupon.create(coupon_list_id: @coupon_list.id)
    @cards = Card.where(card_list_id: @coupon_list.card_list_id)
    @cards.each do |card|
      @cards_coupons = CardsCoupon.create(card_id: card.id, coupon_id: @coupon.id)
    end
    flash[:notice] = "特典を追加しました"
    redirect_to admin_card_list_index_path(current_admin.id)
  end
  
  def edit
  end

  def update
    @coupon_list.update(description: params[:description], expiration: params[:expiration])
    flash[:notice] = "特典情報を変更しました"
    redirect_to admin_card_list_index_path(current_admin.id)
  end

  def destroy
    @coupon_list.destroy
    flash[:notice] = "特典情報を削除しました"
    redirect_to admin_card_list_index_path(current_admin.id)
  end

  private

  def set_coupon
    @coupon_list = CouponList.find(params[:id].to_i)
  end

  def coupon_list_params
    params.permit(:description, :expiration).merge(card_list_id: current_admin.card_list.id)
  end
end
