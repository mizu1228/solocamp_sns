Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users, controllers: {
    registrations:      'users/registrations',
}
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  post 'visited_site/:id' => 'visited_sites#create', as: 'create_visited_site'
  delete 'visited_site/:id' => 'visited_sites#destroy', as: 'destroy_visited_site'

  resources :interes, only: :index
  post 'intere/:id' => 'interes#create', as: 'create_intere'
  delete 'intere/:id' => 'interes#destroy', as: 'destroy_intere'

  resources :users, only: [:show]
  get 'camp_sites/search'
  resources :camp_sites, only: [:index, :new] do
    get 'show'
  end
  resources :tweets, except: :index do
    resources :comments, only: [:new, :create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :relationships, only: [:create, :destroy]
  get '/tweet/tag/:name', to: "tweets#tag"

  resources :gears do
    collection do
      get 'search'
    end
    member do
      get 'edit_search'
    end
  end
  get '/gears/genre_show/:id' => 'gears#genre_show', as: 'genre_show'

end