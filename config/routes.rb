Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :customers
  resources :merchants
  resources :products
  resources :links

  #User Endpoints
  post '/login', to: 'sessions#create'
  post '/signup', to: 'users#create'
  get '/current_user', to: 'users#show'
  put '/current_user', to: 'users#update'
  delete '/current_user', to: 'sessions#destroy'

  #Customer Endpoints
  get '/customer', to: 'customers#show'
  put '/customer', to: 'customers#update'

  #Customer Endpoints
  get '/merchant', to: 'merchants#show'
  put '/merchant', to: 'merchants#update'

  get '/users/:user_id/location', to: 'locations#show'
  put '/users/:user_id/location', to: 'locations#update'
end
