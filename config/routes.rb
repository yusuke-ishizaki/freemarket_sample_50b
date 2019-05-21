Rails.application.routes.draw do

  devise_for :users
  root 'product#index'
<<<<<<< HEAD
  get   '/users_product/:id', to: 'product#users_product'
  resources :product
=======
  resources :product, only: [ :index, :show]
>>>>>>> master
  resources :card, only: [:index, :new]



end
