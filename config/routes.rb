Rails.application.routes.draw do
  root to: "cards#index"
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :admins do
    resources :cards, only: [:edit]
    get 'card_lists' => 'card_lists#index', as: 'card_list_index'
    post 'card_lists/new' => 'card_lists#create', as: 'card_lists'
    resources :card_lists, only: [:new, :edit, :update, :destroy] do
      resources :relations, only: [:edit, :update]
      resources :benefit_lists, only: [:new, :create, :edit, :update, :destroy]
      resources :coupon_lists, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :users do
    resources :cards
    resources :card_lists, only: [:show]
  end

  resources :cards, only: [] do
    collection do
      get 'top'
      get 'search'
    end
  end

end
