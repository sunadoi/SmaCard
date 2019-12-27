require 'rails_helper'

describe CardsController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:card) { create(:card) }
  let(:card_list) { create(:card_list) }
  let(:relation) { create(:relation) }

  describe 'GET #top' do
    it "renders the :top template" do
      get :top
      expect(response).to render_template :top
    end
  end

  describe 'GET #new' do
    it "renders the :new template" do
      login_user user
      get :new, params: { user_id: user.id }
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    before do
      login_user user
      get :show, params: { id: card, user_id: user.id }
    end

    it "assigns the requested card to @card" do
      expect(assigns(:card)).to eq card
    end

    it "renders the :show templete" do
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    before do
      login_user user
      get :edit, params: {  id: card, user_id: user.id }
    end

    it "assigns the requested card to @card" do
      expect(assigns(:card)).to eq card
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
      it "assigns the requested card to @card" do
        patch :update, params: {  id: card, user_id: user.id }
        expect(assigns(:card)).to eq card
      end

      it "changes @card's attributes" do
        patch :update, params: {  id: card, user_id: user.id, point: "100" }
        card.reload
        expect(card.point).to eq(100)
      end
    end
  end

  describe "GET #search" do
    it "renders the :search template" do
      login_user user
      get :search
      expect(response).to render_template :search
    end
  end
end