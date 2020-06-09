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

  # Actor Routes
  resources :actors, only: [:index, :show]

  # Movie Routes
  resources :movies, only: [:index, :show]
end
