require 'rails_helper'

describe BenefitListsController do
  let(:benefit_list) { create(:benefit_list) }
  let(:admin) { create(:admin) }
  let(:card_list) { create(:card_list) }

  describe 'GET #new' do
    it "renders the :new template" do
      get :new, params: { admin_id: admin.id, card_list_id: benefit_list.card_list_id }
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    before do
      login_admin admin
      post :create, params: { admin_id: admin.id, card_list_id: benefit_list.card_list_id }
    end

    it "saves the new benefit_list in the database" do
      expect{post :create, params: { admin_id: admin.id, card_list_id: benefit_list.card_list_id, description: "3つで10%オフ"}}.to change(BenefitList, :count).by(1)
    end

    it "redirects to admin_card_list_index_path" do
      post :create, params: {  admin_id: admin.id, card_list_id: benefit_list.card_list_id, description: "3つで10%オフ" }
      expect(response).to redirect_to admin_card_list_index_path(admin.id)
    end
    
  end

  describe "GET #edit" do
    before do
      login_admin admin
      get :edit, params: {  id: benefit_list, admin_id: admin.id, card_list_id: benefit_list.card_list_id }
    end

    it "assigns the requested benefit_list to @benefit_list" do
      expect(assigns(:benefit_list)).to eq benefit_list
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
      it "assigns the requested benefit_list to @benefit_list" do
        patch :update, params: {  id: benefit_list, admin_id: admin.id, card_list_id: benefit_list.card_list_id }
        expect(assigns(:benefit_list)).to eq benefit_list
      end

      it "changes @benefit_list's attributes" do
        patch :update, params: {  id: benefit_list, admin_id: admin.id, card_list_id: benefit_list.card_list_id, description: "100円オフ" }
        benefit_list.reload
        expect(benefit_list.description).to eq("100円オフ")
      end

      it "redirects to admin_card_list_index_path" do
        patch :update, params: {  id: benefit_list, admin_id: admin.id, card_list_id: benefit_list.card_list_id, description: "100円オフ" }
        benefit_list.reload
        expect(response).to redirect_to admin_card_list_index_path(admin.id)
      end
    end

    context "when update failed" do
      it "renders the :edit templete" do
        patch :update, params: {  id: benefit_list, admin_id: admin.id, card_list_id: benefit_list.card_list_id, description: "" }
        benefit_list.reload
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      login_admin admin
      get :destroy, params: {  id: benefit_list, admin_id: admin.id, card_list_id: benefit_list.card_list_id }
    end

    it "assigns the requested benefit_list to @benefit_list" do
      expect(assigns(:benefit_list)).to eq benefit_list
    end

    it "deletes benefit_list" do
      benefit_list = create(:benefit_list)
      expect{delete :destroy, params: {id: benefit_list, admin_id: admin.id, card_list_id: benefit_list.card_list_id}}.to change(BenefitList, :count).by(-1)
    end

    it "renders the :edit templete" do
      expect(response).to redirect_to admin_card_list_index_path(admin.id)
    end
  end
end