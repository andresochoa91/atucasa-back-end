Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users
  # resources :customers
  # resources :merchants
  # resources :products
  # resources :links

  #User Endpoints
  post '/sign_up', to: 'users#create'
  post '/log_in', to: 'sessions#create'
  delete '/log_out', to: 'sessions#destroy'
  get '/current_user', to: 'users#show'
  put '/current_user/update', to: 'users#update'

  #Location Endpoints
  get '/current_user/location', to: 'locations#show'
  put '/current_user/location', to: 'locations#update'

  #Customer Endpoints
  get '/current_user/customer', to: 'customers#show'
  put '/current_user/customer', to: 'customers#update'

  #Merchant Endpoints
  get '/current_user/customer/merchants', to: 'merchants#index'
  get '/current_user/customer/merchants/:id', to: 'merchants#show'
  get '/current_user/merchant', to: 'merchants#show_merchant_data'
  put '/current_user/merchant', to: 'merchants#update'

  #Products Endpoints
  get '/current_user/merchant/products', to: 'products#index'
  get '/current_user/merchant/products/:id', to: 'products#show'
  post '/current_user/merchant/products', to: 'products#create'
  put '/current_user/merchant/products/:id', to: 'products#update'
  delete '/current_user/merchant/products/:id', to: 'products#destroy'

  #Links Endpoints
  get '/current_user/merchant/links', to: 'links#index'
  get '/current_user/merchant/links/:id', to: 'links#show'
  post '/current_user/merchant/links', to: 'links#create'
  put '/current_user/merchant/links/:id', to: 'links#update'
  delete '/current_user/merchant/links/:id', to: 'links#destroy'

  #Orders Endpoints
  get '/current_user/customer/merchants/:merchant_id/orders', to: 'orders#index'
  get '/current_user/customer/merchants/:merchant_id/orders/:id', to: 'orders#show'
  post '/current_user/customer/merchants/:merchant_id/orders', to: 'orders#create'

  #Product Order Endpoints
  get '/current_user/customer/merchants/:merchant_id/orders/:order_id/products', to: 'product_orders#index'
  get '/current_user/customer/merchants/:merchant_id/orders/:order_id/products/:id', to: 'product_orders#show'
  put '/current_user/customer/merchants/:merchant_id/orders/:order_id/products/:id', to: 'product_orders#update'
  delete '/current_user/customer/merchants/:merchant_id/orders/:order_id/products/:id', to: 'product_orders#destroy'

end
