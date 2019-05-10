Rails.application.routes.draw do

  root 'users#index'
  resources :users, only: [:index, :plofile, :personal_info, :new, :show, :edit]


end
