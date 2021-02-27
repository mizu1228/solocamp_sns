Rails.application.routes.draw do
  get 'tweets/index'
  devise_for :users
end
