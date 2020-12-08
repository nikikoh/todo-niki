Rails.application.routes.draw do
  root to: 'boards#index'
  devise_for :users

  resources :boards, only: %i[new create edit update destroy] do
    resources :tasks, only: %i[index new create edit update destroy]
  end
end
