Rails.application.routes.draw do


  #welcome
  root to: 'welcome#index'

  get '/wines/search'                        => 'wines#search', as: 'search_wines'
  get '/wines/search_by_food'                => 'wines#search_by_food'
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
  resources :wine_reviews


end
