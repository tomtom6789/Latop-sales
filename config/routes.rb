Rails.application.routes.draw do

  get '/' => 'sessions#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  delete '/logout', to: "sessions#destroy"


  resources :reviews
  resources :ice_creams
  resources :users
end 