Rails.application.routes.draw do
  get 'cache_urls/show'
  get 'cache_urls/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :merchants, only: [:index, :show]
  resources :users
  # resources :users, only: [:show]

  #User Endpoints
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'
  get '/current_user', to: 'users#show'
  put '/current_user/update', to: 'users#update'

  #Location Endpoints
  get '/current_user/location', to: 'locations#show'
  put '/current_user/location', to: 'locations#update'

  #Customer Endpoints
  get '/current_user/customer', to: 'customers#show'
  put '/current_user/customer', to: 'customers#update'

  #Merchant Endpoints
  get '/current_user/merchant', to: 'merchants#show_merchant_data'
  put '/current_user/merchant', to: 'merchants#update'

  get '/:slug', to: 'merchants#show_through_slug'
  get '/merchants/product/:searchbox', to: 'merchants#index_searchbox'

  #Products Endpoints
  get '/current_user/products', to: 'products#index'
  get '/current_user/products/:id', to: 'products#show'
  post '/current_user/products', to: 'products#create'
  put '/current_user/products/:id', to: 'products#update'
  delete '/current_user/products/:id', to: 'products#destroy'

  #Links Endpoints
  get '/current_user/links', to: 'links#index'
  get '/current_user/links/:id', to: 'links#show'
  post '/current_user/links', to: 'links#create'
  put '/current_user/links/:id', to: 'links#update'
  delete '/current_user/links/:id', to: 'links#destroy'

  #Orders Endpoints
  get '/current_user/orders', to: 'orders#index'
  get '/current_user/orders/:id', to: 'orders#show'
  post '/merchants/:merchant_id/create_order', to: 'orders#create'
  put '/current_user/orders/:id', to: 'orders#update'
  delete '/current_user/orders/:id', to: 'orders#destroy'

  get '/current_user/check_delivered/:id', to: 'orders#check_delivered'

  #Product Order Endpoints
  # get '/current_user/orders/:order_id/products_order', to: 'product_orders#index'
  # get '/current_user/orders/:order_id/products_order/:id', to: 'product_orders#show'
  # put '/current_user/orders/:order_id/products_order/:id', to: 'product_orders#update'
  # delete '/current_user/orders/:order_id/products_order/:id', to: 'product_orders#destroy'

  get '/products_order/:id', to: 'product_orders#show'
  put '/products_order/:id', to: 'product_orders#update'
  delete '/products_order/:id', to: 'product_orders#destroy'

  #Cache URL

  post '/cache/show_no_url', to: 'cache_urls#show' #show without coords url
  post '/cache/no_url', to: 'cache_urls#create' #create without coords url
  
  get '/cache/:url', to: 'cache_urls#show'
  post '/cache/:url', to: 'cache_urls#create'

  #Cache for Coods
  # get '/cache', to: 'cache_urls#show'


end
