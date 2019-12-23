class CardListsController < ApplicationController
  def new
    @card_list = CardList.new
    @relation = Relation.new
    @benefit_list = BenefitList.new
    @coupon_list = CouponList.new
  end

  def create
    @relation = Relation.new(relation_params)
    @card_list = CardList.new(admin_id: current_admin.id, relation_id: @relation.id)
    @benefit_list = BenefitList.new(benefit_params)
    @coupon_list = CouponList.new(coupon_params)
    if @relation.save && @card_list.save && @benefit_list.save && @coupon_list.save
      flash[:notice] = "カードを登録しました"
      redirect_to top_cards_path
    else
      flash.now[:alert] = '必要事項を入力してください。'
      render action: :new
    end
  end

  private

  def relation_params
    params.require(:relation).permit(:name, :location, :opening_time, :closing_time, :tel, :url)
  end

  def benefit_params
    params.require(:benefit_list).permit(:description).merge(card_list_id: @card_list.id)
  end

  def coupon_params
    params.require(:coupon_list).permit(:description, :expiration).merge(card_list_id: @card_list.id)
  end

end
