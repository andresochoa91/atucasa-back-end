Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :customers
  resources :merchants
  resources :products
  resources :links

  get '/current_user', to: 'users#show'
  post '/sign_up', to: 'users#create'

  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get '/users/:user_id/location', to: "locations#show"
  put '/users/:user_id/location', to: "locations#update"
end
