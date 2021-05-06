Rails.application.routes.draw do

  # Session Routes
  root 'sessions#new'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  # User Routes
  get '/homepage', to: 'users#homepage'

  resources :users

  # Playlist Routes
  resources :playlists
  resources :playlist_movies

  # Actor Routes
  resources :actors, only: [:show] do
    get 'search', on: :collection
  end 
  
  # Movie Routes
  resources :movies, only: [:show] do 
    get 'search', on: :collection
  end 

  # AI Routes
  resources :ai_routes, only: [:new] do 
    get 'generate', on: :collection
  end 

  # Review Routes
  resources :reviews, only: [:create, :destroy]
end
