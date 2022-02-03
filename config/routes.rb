Rails.application.routes.draw do

  root to: 'pages#home'
  
  get '/home' => 'pages#home'
  
  get '/login' => 'session#new'         # login form
  post '/login' => 'session#create'     # performs login, redirect
  delete '/login' => 'session#destroy'  # logout, redirect 
  
  get '/users/new' => 'users#new'
  post '/users/:id/edit' => 'users#edit' 
  post '/users/:id/likes/:id' => 'likes#show'
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  get '/users/:id/following' => 'following#show'
  get '/users/create'
  get '/users/destroy'
  
  post '/reviews/:id' => 'reviews#show'
  resources :comments
  
  resources :lists
  resources :users do
    resources :followers, :following
  end


  resources :reviews do 
    resources :likes, :comments
  end



end
