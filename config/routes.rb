Rails.application.routes.draw do

  devise_for :users
  root 'product#index'
  get   '/users_product/:id', to: 'product#users_product'
  resources :product
  resources :card, only: [:index, :new]

  resources :users


end
