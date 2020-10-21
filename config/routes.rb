Rails.application.routes.draw do
  get '/' => 'pages#index'
  get 'pages/show'
  resources :users
  devise_for :users
end
