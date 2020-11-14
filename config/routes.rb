Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users
  resources :boards
  resource :profile do
    post :confirm, on: :collection
  end

  devise_scope :user do
    get 'sign_in', to: 'users/registrations#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end
end
