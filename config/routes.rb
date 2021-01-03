Rails.application.routes.draw do
  root to: 'boards#index'
  devise_for :users

  resources :boards,  only: %i[index show create new edit update destroy] do
    resources :tasks, only: %i[index show create new edit update destroy]
  end
end
