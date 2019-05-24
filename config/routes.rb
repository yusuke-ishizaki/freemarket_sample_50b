Rails.application.routes.draw do

  devise_for :users
  root 'product#index'
  resources :users
  get   '/users_product/:id', to: 'product#users_product'
  get   '/product_status/:id', to: 'product#product_status'
  resources :product
  get '/logout' => 'users#logout'

  resources :card, only: [:new, :show, :index] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase, only: [:index] do
    collection do
    get 'index', to: 'purchase#index'
    post 'pay', to: 'purchase#pay'
    get 'done', to: 'purchase#done'
    get 'confrm', to: 'purchase#confirm'
    end
  end

  get '/profile' => 'users#personal_info'

# get "/product/product_info"

end
