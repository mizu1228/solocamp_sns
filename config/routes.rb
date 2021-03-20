Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users, controllers: {
    registrations:      'users/registrations',
}
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  resources :users, only: [:show]
  get 'camp_sites/search'
  resources :camp_sites, only: :index do
    get 'show'
  end
  resources :tweets, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :relationships, only: [:create, :destroy]
  get '/tweet/tag/:name', to: "tweets#tag"
end