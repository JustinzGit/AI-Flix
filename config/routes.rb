Rails.application.routes.draw do

  # User Routes
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # Session Routes
  get '/homepage', to: 'sessions#homepage'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy', as: 'logout'

end
