Rails.application.routes.draw do

  root to: 'pages#home'
  
  get '/home' => 'pages#home'
  
  get '/login' => 'session#new'         # login form
  post '/login' => 'session#create'     # performs login, redirect
  delete '/login' => 'session#destroy'  # logout, redirect 
  
  get '/users/new' => 'users#new'
  # get '/user/:id' => 'users#show' 
  get '/users/create'
  get '/users/destroy'

  resources :reviews, :lists, :users

end
