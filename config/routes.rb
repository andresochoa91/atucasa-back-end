Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/create'
  get 'orders/update'
  get 'orders/destroy'
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
  get '/current_user/customer_data/merchants', to: 'merchants#index'
  get '/current_user/customer_data/merchants/:id', to: 'merchants#show'
  get '/current_user/merchant_data', to: 'merchants#show_merchant_data'
  put '/current_user/merchant_data', to: 'merchants#update'

  #Products Endpoints
  get '/current_user/merchant_data/products', to: 'products#index'
  get '/current_user/merchant_data/products/:id', to: 'products#show'
  post '/current_user/merchant_data/products', to: 'products#create'
  put '/current_user/merchant_data/products/:id', to: 'products#update'
  delete '/current_user/merchant_data/products/:id', to: 'products#destroy'

  #Links Endpoints
  get '/current_user/merchant_data/links', to: 'links#index'
  get '/current_user/merchant_data/links/:id', to: 'links#show'
  post '/current_user/merchant_data/links', to: 'links#create'
  put '/current_user/merchant_data/links/:id', to: 'links#update'
  delete '/current_user/merchant_data/links/:id', to: 'links#destroy'

  #Orders Endpoints
  get '/current_user/customer_data/merchants/:merchant_id/orders', to: 'orders#index'
  get '/current_user/customer_data/merchants/:merchant_id/orders/:id', to: 'orders#show'
  post '/current_user/customer_data/merchants/:merchant_id/orders', to: 'orders#create'
  # post '/current_user/merchant_data/links', to: 'links#create'
  # put '/current_user/merchant_data/links/:id', to: 'links#update'
  # delete '/current_user/merchant_data/links/:id', to: 'links#destroy'
end
