Rails.application.routes.draw do

  root 'product#index'
  resources :product, only: [ :index, :show]  
  resources :card, only: [:index, :new]


end
