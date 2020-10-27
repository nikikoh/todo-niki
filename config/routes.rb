Rails.application.routes.draw do
  get '/' => 'pages#index'
  get 'show' => 'pages/show'
  get '/new', to: 'users#new'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show]

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end
end
