Rails.application.routes.draw do
  #welcome
  get '/'   => 'welcome#index', as: 'root'

  #Users
  resources :users

  #Sessions
  get '/login'     => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get 'logout'     => 'sessions#destroy'

  #Wines
  resources :wines

end
