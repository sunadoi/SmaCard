require 'rails_helper'

describe RelationsController do
  let(:relation) { create(:relation) }


  describe "GET #edit" do
    before do
      get :edit, params: {  id: relation, admin_id: relation.card_list.admin_id, card_list_id: relation.card_list_id }
    end

    it "assigns the requested relation to @relation" do
      expect(assigns(:relation)).to eq relation
    end

    it "renders the :edit templete" do
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    before do
      patch :update, params: {  id: relation, admin_id: relation.card_list.admin_id, card_list_id: relation.card_list_id }
    end

    context "when update success" do
      it "assigns the requested relation to @relation" do
        expect(assigns(:relation)).to eq relation
      end

      it "changes @relation's attributes" do
        patch :update, params: {  id: relation, admin_id: relation.card_list.admin_id, card_list_id: relation.card_list_id, name: "fuga", tel: "0120" }
        relation.reload
        expect(relation.name).to eq("fuga")
        expect(relation.tel).to eq("0120")
      end

      it "redirects to admin_card_list_index_path" do
        expect(response).to redirect_to admin_card_list_index_path(relation.card_list.admin_id)
      end
    end

    context "when update failed" do
      it "renders the :edit templete" do
        patch :update, params: {  id: relation, admin_id: relation.card_list.admin_id, card_list_id: relation.card_list_id, name: "" }
        relation.reload
        expect(response).to render_template :edit
      end
    end
  end
end