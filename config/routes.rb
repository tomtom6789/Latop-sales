Rails.application.routes.draw do

  root 'sessions#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'




  delete '/logout', to: "sessions#destroy" 




  get '/auth/:provider/callback' => 'sessions#omniauth'



  resources :users
  resources :brands do 
    resources :laptops
  end 
  resources :reviews


  get '/laptops/most_expensive', to: 'laptops#expensive', as: 'expensive'

  resources :laptops do 
    resources :reviews
  end 

  




end 