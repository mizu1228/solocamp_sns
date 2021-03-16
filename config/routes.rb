Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users, controllers: {
    registrations:      'users/registrations',
}

  resources :users, only: [:show]
  resources :tweets, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :relationships, only: [:create, :destroy]
  get '/tweet/tag/:name', to: "tweets#tag"
end