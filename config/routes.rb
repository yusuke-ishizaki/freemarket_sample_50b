Rails.application.routes.draw do

  # root 'users#index'
  root 'product#index'
  get 'product' => 'product#index'
  get 'card' => 'card#index'
  get 'card/new' => 'card#new'
  # root 'users#plofile'
  # resources :users, only: [:index, :plofile, :personal_info, :new, :show, :edit]


end
