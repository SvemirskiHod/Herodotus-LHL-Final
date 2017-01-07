Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  resources :movies, only: [:index, :show] do
    resources :comments, only: [:create, :destroy, :update]
    resources :users do
      resources :notes
    end
  end

  resources :titles, only: [:index, :show]
  resources :adv_searches, only: [:index, :show]
end
