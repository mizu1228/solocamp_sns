Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users

  resources :user, only: [:show]
end