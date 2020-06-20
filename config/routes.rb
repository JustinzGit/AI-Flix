Rails.application.routes.draw do

  # login page as root
  root 'sessions#new'

  # User Routes
  get '/homepage', to: 'users#homepage'

  resources :users, only: [:new, :create] do
    resources :playlists, only: [:index, :show]
  end

  # Session Routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  # Actor Routes
  get '/actors/search', to: 'actors#search', as: 'search_actors'
  resources :actors, only: [:show]
  
  # Movie Routes
  get '/movies/search', to: 'movies#search', as: 'search_movies'
  resources :movies, only: [:show]

  # Path Routes
  resources :paths

  get '/path/actor_1/:actor_1', to: 'paths#actor_1', as: 'actor_1'
  get '/path/actor_2/:actor_2', to: 'paths#actor_2', as: 'actor_2'
  get '/path/clear_actor_names', to: 'paths#clear_actor_names', as: 'clear_actor_names'

  # Playlist Routes
  resources :playlists, only: [:new, :create]

  get '/select_movie/:movie_id', to: 'playlists#select_movie', as: 'select_movie'
  get '/playlist/:playlist_id/movie/:movie_id', to: 'playlists#add_movie', as: 'add_movie'

  # Review Routes
  resources :reviews, only: [:create, :destroy]

  # Provider Callback
  get '/auth/github/callback', to: 'sessions#create'
end
