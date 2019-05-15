Rails.application.routes.draw do

  # root 'users#index'
  root 'product#index'
  get 'product/index'
  # root 'users#plofile'
  # resources :users, only: [:index, :plofile, :personal_info, :new, :show, :edit]


end
