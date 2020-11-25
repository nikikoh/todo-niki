Rails.application.routes.draw do
  devise_for :users
  resources :users

  root to: 'boards#index'

  resources :boards
end
