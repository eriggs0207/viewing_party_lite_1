# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/', to: 'landings#index' is the same?
  root 'landings#index'

  # resources :sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'dashboard', to: 'users#show'
  # resources :users, only: [:show], path: 'dashboard'
  resources :discover, only: :index
  resources :movies, only: %i[show index] do
    resources :parties, only: %i[new create]
  end
  resources :users, only: [:new, :create], path: 'register'
  # resources :users, only: %i[create]
end
