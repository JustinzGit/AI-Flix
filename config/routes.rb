Rails.application.routes.draw do

  # Session Routes
  root 'sessions#new'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  # Playlist Routes
  resources :playlists
  resources :playlist_movies

  # Actor Routes
  resources :actors, only: [:show] do
    get 'search', on: :collection
  end 
  
  # Movie Routes
  get '/homepage', to: 'movies#homepage'
  resources :movies, only: [:show] do 
    get 'search', on: :collection
  end 

  # AI Routes
  resources :ai_movie_routes, only: [:new] do 
    get 'generate', on: :collection
  end 

  # Review Routes
  resources :reviews, only: [:create, :destroy]
end
