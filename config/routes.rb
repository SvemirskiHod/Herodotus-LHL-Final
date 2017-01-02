Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  resources :movies, only: [:index, :show] do
    resource :comments, only: [:create]
    resources :users do
      resource :notes, only: [:create, :show, :index]
    end
  end

  resources :titles, only: [:index, :show]
  resources :adv_searches, only: [:index, :show]
end
