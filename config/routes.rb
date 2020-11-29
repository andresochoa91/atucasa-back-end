Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :customers
  resources :merchants
  resources :products
  resources :links

  post '/login', to: 'sessions#create'
  get '/current_user', to: 'users#show'
  post '/signup', to: 'users#create'
  put '/current_user', to: 'users#update'
  delete '/current_user', to: 'sessions#destroy'


  get '/users/:user_id/location', to: 'locations#show'
  put '/users/:user_id/location', to: 'locations#update'
end
