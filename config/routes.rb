Rails.application.routes.draw do

  devise_for :users
  root 'product#index'
  resources :product, only: [ :index, :show]  
  resources :card, only: [:index, :new]


end
