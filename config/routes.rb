Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users, controllers: {
    registrations:      'users/registrations',
}

  resources :users, only: [:show]
  resources :tweets, only: [:new, :create]
  resources :relationships, only: [:create, :destroy]
end