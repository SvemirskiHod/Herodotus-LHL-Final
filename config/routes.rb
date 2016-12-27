Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # root to: "movies#index"

  resources :movies, only: [:index, :show]
  resources :titles, only: [:index, :show]
  resources :adv_searches, only: [:index, :show]
  # resources :users
end
