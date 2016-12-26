Rails.application.routes.draw do
  devise_for :user, only: []
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: {format: :json} do
    resource :login, only: [:create], controller: :sessions
  end

  resources :movies, only: [:index, :show]
  resources :titles, only: [:index, :show]
  resources :adv_searches, only: [:index, :show]
  resources :users, only: [:create]
end
