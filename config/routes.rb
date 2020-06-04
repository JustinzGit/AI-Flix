Rails.application.routes.draw do

  # User Controller
  resources :users, only: [:index, :new, :create]
  get '/homepage', to: 'users#homepage'

  # Sessions Controller
  resources :sessions, only: [:new, :create, :destroy]
  # get '/login', to: 'sessions#login'
  # get '/logout', to: 'sessions#logout'
end
