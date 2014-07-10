Rails.application.routes.draw do
  #welcome
  get '/'   => 'welcome#index', as: 'root'

  #Users
  resources :users

  #Sessions
  get '/login'     => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get 'logout'     => 'sessions#destroy'

  #Search
  # get '/wines/search'   => 'wines#search', as: 'search_wines'

  #Wines
  resources :wines do
    get 'search', on: :collection
    post 'add_to_user_favorites', on: :collection
  end

  #Reviews
  resources :reviews


end
