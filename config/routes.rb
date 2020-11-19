Rails.application.routes.draw do
  devise_for :users

  resources :users

  # コントローラーにauthenticate_user!があれば
  # boardsには行かないと思ったので、root化
  root to: 'boards#index'
  resources :boards
end
