Rails.application.routes.draw do
  root to: 'boards#index'
  devise_for :users

  resources :boards, only: %i[new create edit update destroy]
end
