Rails.application.routes.draw do
  root to: 'boards#index'
  devise_for :users

  resources :users do
    resources :boards
  end
end
