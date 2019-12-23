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
    post 'card_lists/new' => 'card_lists#create', as: 'card_lists'
    resources :card_lists, only: [:new, :edit, :update, :destroy]
  end

  resources :cards do
    collection do
      get 'top'
    end
    resources :admins
  end

end
