Rails.application.routes.draw do
  resources :users 
  
  get 'users/:id/merchant', to: 'merchants#show'
  put 'users/:id/merchant', to: 'merchants#update'

  get 'users/:id/customer', to: 'customers#show'
  put 'users/:id/customer', to: 'customers#update'
  
  get 'users/:id/admin', to: 'admins#show'
  put 'users/:id/admin', to: 'admins#update'

  # resources :merchants, only: [:update]
  # resources :customers, only: [:update]
  # resources :admins, only: [:update]
end
