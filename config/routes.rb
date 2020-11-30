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

  #Location Endpoints
  get '/current_user/location', to: 'locations#show'
  put '/current_user/location', to: 'locations#update'

  #Customer Endpoints
  get '/current_user/customer_data', to: 'customers#show'
  put '/current_user/customer_data', to: 'customers#update'

  #Merchant Endpoints
  get '/current_user/merchant_data', to: 'merchants#show_merchant_data'
  put '/current_user/merchant_data', to: 'merchants#update'

  #Merchant Endpoints
  get '/current_user/merchant_data/products', to: 'products#index'
  get '/current_user/merchant_data/products/:id', to: 'products#show'
  post '/current_user/merchant_data/products', to: 'products#create'
  put '/current_user/merchant_data/products/:id', to: 'products#update'

  get '/users/:user_id/location', to: 'locations#show'
  put '/users/:user_id/location', to: 'locations#update'
end
