Rails.application.routes.draw do

  devise_for :users
  root 'product#index'
  resources :users
  get   '/users_product/:id', to: 'product#users_product'
  resources :product
  resources :card, only: [:index, :new]
  get '/logout' => 'users#logout'

end
