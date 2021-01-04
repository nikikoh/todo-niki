Rails.application.routes.draw do
  root to: 'boards#index'
  devise_for :users

  resources :boards do
    resources :tasks
  end
end
