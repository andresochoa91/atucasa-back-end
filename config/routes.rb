Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :customers
  resources :merchants
  resources :products
  
  post "login", to: "sessions#create"
  delete "login", to: "sessions#destroy"
end
