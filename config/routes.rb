Rails.application.routes.draw do
  root to: 'boards#index'
  devise_for :users

  resources :boards, only: %i[index new create edit update destroy] do
    member do
      resources :tasks, only: %i[index new create edit update destory]
    end
  end
end
