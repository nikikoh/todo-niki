Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  root to: 'boards#index'
  devise_for :users

  resources :boards do
    resources :tasks
  end

  resources :tasks do
    resources :comments
  end
end
