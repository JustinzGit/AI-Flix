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

  # Path Routes
  resources :paths, only: [:index, :new, :create, :show, :destroy]

  get '/path/actor_1/:actor_1', to: 'paths#actor_1', as: 'path_actor_1'
  get '/path/actor_2/:actor_2', to: 'paths#actor_2', as: 'path_actor_2'
  get '/path/clear_actors', to: 'paths#clear_actors', as: 'clear_actors'

  # Actor Routes
  resources :actors, only: [:index, :show]

  # Movie Routes
  resources :movies, only: [:index, :show]

  # Review Routes
  resources :reviews, only: [:create, :destroy]
end
