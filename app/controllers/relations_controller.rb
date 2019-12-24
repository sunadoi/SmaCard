class RelationsController < ApplicationController
  before_action :set_relation

  def edit
  end

  def update
    if @relation.update(relation_params)
      flash[:notice] = "登録内容を変更しました"
      redirect_to admin_card_list_index_path(current_admin.id)
    else
      flash.now[:alert] = '必要事項を入力してください。'
      render action: :edit
    end
  end

  private

  def relation_params
    params.permit(:name, :location, :opening_time, :closing_time, :tel, :url)
  end

  def set_relation
    @relation = Relation.find(params[:id])
  end
end
