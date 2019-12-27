require 'rails_helper'

describe CouponListsController do
  let(:coupon_list) { create(:coupon_list) }
  let(:admin) { create(:admin) }
  let(:card_list) { create(:card_list) }

  describe 'GET #new' do
    before do
      login_admin admin
      get :new, params: { admin_id: admin.id, card_list_id: coupon_list.card_list_id }
    end
    
    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    before do
      login_admin admin
      post :create, params: { admin_id: admin.id, card_list_id: coupon_list.card_list_id }
    end

    it "saves the new coupon_list in the database" do
      expect{post :create, params: { admin_id: admin.id, card_list_id: coupon_list.card_list_id, description: "10%オフ", expiration: "2019-12-30"}}.to change(CouponList, :count).by(1)
    end

    it "redirects to admin_card_list_index_path" do
      post :create, params: {  admin_id: admin.id, card_list_id: coupon_list.card_list_id, description: "10%オフ" }
      expect(response).to redirect_to admin_card_list_index_path(admin.id)
    end
  end

  describe "GET #edit" do
    before do
      login_admin admin
      get :edit, params: {  id: coupon_list, admin_id: admin.id, card_list_id: coupon_list.card_list_id }
    end

    it "assigns the requested coupon_list to @coupon_list" do
      expect(assigns(:coupon_list)).to eq coupon_list
    end

    it "renders the :edit templete" do
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    before do
      login_admin admin
    end

    context "when update success" do
      it "assigns the requested coupon_list to @coupon_list" do
        patch :update, params: {  id: coupon_list, admin_id: admin.id, card_list_id: coupon_list.card_list_id }
        expect(assigns(:coupon_list)).to eq coupon_list
      end

      it "changes @coupon_list's attributes" do
        patch :update, params: {  id: coupon_list, admin_id: admin.id, card_list_id: coupon_list.card_list_id, description: "100円オフ" }
        coupon_list.reload
        expect(coupon_list.description).to eq("100円オフ")
      end

      it "redirects to admin_card_list_index_path" do
        patch :update, params: {  id: coupon_list, admin_id: admin.id, card_list_id: coupon_list.card_list_id, description: "100円オフ" }
        coupon_list.reload
        expect(response).to redirect_to admin_card_list_index_path(admin.id)
      end
    end

    context "when update failed" do
      it "renders the :edit templete" do
        coupon_list = create(:coupon_list)
        patch :update, params: {  id: coupon_list, admin_id: admin.id, card_list_id: coupon_list.card_list_id, expiration: "hoge" }
        coupon_list.reload
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      login_admin admin
      get :destroy, params: {  id: coupon_list, admin_id: admin.id, card_list_id: coupon_list.card_list_id }
    end

    it "assigns the requested coupon_list to @coupon_list" do
      expect(assigns(:coupon_list)).to eq coupon_list
    end

    it "deletes benefit_list" do
      coupon_list = create(:coupon_list)
      expect{delete :destroy, params: {id: coupon_list, admin_id: admin.id, card_list_id: coupon_list.card_list_id}}.to change(CouponList, :count).by(-1)
    end

    it "redirects to admin_card_list_index_path" do
      expect(response).to redirect_to admin_card_list_index_path(admin.id)
    end
  end
end