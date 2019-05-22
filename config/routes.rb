Rails.application.routes.draw do

  get 'purchase/index'
  get 'purchase/done'
  devise_for :users
  root 'product#index'
  get   '/users_product/:id', to: 'product#users_product'
  resources :product

  resources :card, only: [:new, :show, :index] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  get   '/purchase/confirm/:id', to: 'purchase#confirm'

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end


end
