require 'rails_helper'

describe CardListsController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:card_list) { admin.card_list }
  let(:relation) { create(:relation) }

  describe 'GET #show' do
    before do
      login_user user
      get :show, params: { id: card_list.id, user_id: user.id }
    end
    
    it "assigns the requested card_list to @card_list" do
      expect(assigns(:card_list)).to eq card_list
    end

    it "renders the :show templete" do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before do
      login_admin admin
    end

    context "when admin has a card_list" do
      it "redirects to admin_card_list_index_path" do
        get :new, params: { admin_id: admin.id }
        expect(response).to redirect_to admin_card_list_index_path(admin.id)
      end
    end
    
  end

  describe "DELETE #destroy" do
    before do
      login_admin admin
      get :destroy, params: {  id: card_list, admin_id: admin.id }
    end

    it "assigns the requested card_list to @card_list" do
      expect(assigns(:card_list)).to eq card_list
    end

    it "deletes card_list" do
      card_list = create(:card_list)
      expect{delete :destroy, params: {id: card_list, admin_id: admin.id}}.to change(CardList, :count).by(-1)
    end

    it "redirects to new_admin_card_list_path" do
      expect(response).to redirect_to new_admin_card_list_path(admin.id)
    end
  end

end
