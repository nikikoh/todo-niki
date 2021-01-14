Rails.application.routes.draw do
  root to: 'boards#show'
  devise_for :users

  resources :boards do
    resources :tasks
  end

  resources :tasks do
    resources :comments
  end
end
