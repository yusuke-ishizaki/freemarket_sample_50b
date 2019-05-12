Rails.application.routes.draw do

  # root 'users#index'
  root 'users#personal_info'
  # root 'users#plofile'
  # resources :users, only: [:index, :plofile, :personal_info, :new, :show, :edit]


end
