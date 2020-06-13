Rails.application.routes.draw do

  # Set login page as root
  root 'sessions#new'

  # User Routes
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/homepage', to: 'users#homepage'

  # Session Routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy', as: 'logout'

  # Playlist Routes
  resources :playlists, only: [:new, :create, :show, :destroy]

  get '/playlist/actor_1/:actor_1', to: 'playlists#actor_1', as: 'playlist_actor_1'
  get '/playlist/actor_2/:actor_2', to: 'playlists#actor_2', as: 'playlist_actor_2'
  get '/playlist/clear_actors', to: 'playlists#clear_actors', as: 'clear_actors'

  # Actor Routes
  resources :actors, only: [:index, :show]

  # Movie Routes
  resources :movies, only: [:index, :show]

  # Review Routes
  resources :reviews, only: [:new, :create, :destroy]
end
