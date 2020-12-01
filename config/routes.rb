Rails.application.routes.draw do
  root to: 'boards#index'
  devise_for :users

  resources :boards, only: %i[index show new create destroy]
end
