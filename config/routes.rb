Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create]
  get '/homepage', to: 'users#homepage'
end
