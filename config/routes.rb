Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :movies, only: [:index, :show]
  resources :titles, only: [:index, :show]
  resources :adv_searches, only: [:index, :show]
  resources :users, only: [:create]
end
