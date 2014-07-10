Rails.application.routes.draw do


  #welcome
  get '/'   => 'welcome#index', as: 'root'

  get '/wines/search'                         => 'wines#search', as: 'search_wines'
  post '/wines/add_to_user_favorites_wines'  => 'wines#add_to_user_favorites', as: 'add_to_user_favorites_wines'

  #Users
  post '/users/remove_wine'  => 'users#remove_wine'
  resources :users

  #Sessions
  get '/login'     => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get 'logout'     => 'sessions#destroy'

  #Wines
  resources :wines

  #Reviews
  resources :reviews


end
