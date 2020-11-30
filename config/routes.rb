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
  get '/current_user/customer_info', to: 'customers#show'
  put '/current_user/customer_info', to: 'customers#update'

  #Customer Endpoints
  get '/current_user/merchant_info', to: 'merchants#show_merchant_info'
  put '/current_user/merchant_info', to: 'merchants#update'

  get '/users/:user_id/location', to: 'locations#show'
  put '/users/:user_id/location', to: 'locations#update'
end
