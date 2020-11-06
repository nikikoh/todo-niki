Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/new'
  get 'tasks/edit'
  get 'new', to: 'users#new'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: %i[show edit update destroy]
  resources :tasks

  devise_scope :user do
    get 'sign_in', to: 'users/registrations#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end
end
