Rails.application.routes.draw do

  devise_for :users
  root 'product#index'
  resources :users
  get   '/users_product/:id', to: 'product#users_product'
  resources :product 
 

  resources :card, only: [:new, :show, :index] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  get '/purchase/confirm/:id', to: 'purchase#confirm'
  get '/purchase/index/:id', to: 'purchase#index'

  resources :purchase, only: [:index] do
    collection do
    get 'index', to: 'purchase#index'
    post 'pay', to: 'purchase#pay'
    get 'done', to: 'purchase#done'
    end
  end

end
