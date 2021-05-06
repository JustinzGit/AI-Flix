Rails.application.routes.draw do

  # Session Routes
  root 'sessions#new'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  # User Routes
  get '/homepage', to: 'users#homepage'

  resources :users
  # resources :users, only: [:new, :create] do
  #   resources :paths, only: [:new, :index, :show]
  # end

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

  # Path Routes
  resources :ai_routes
  # get '/path/actor_1/:actor_1', to: 'paths#actor_1', as: 'actor_1'
  # get '/path/actor_2/:actor_2', to: 'paths#actor_2', as: 'actor_2'
  # get '/path/clear_actor_names', to: 'paths#clear_actor_names', as: 'clear_actor_names'

  # Review Routes
  resources :reviews, only: [:create, :destroy]
end
