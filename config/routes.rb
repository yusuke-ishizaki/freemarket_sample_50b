Rails.application.routes.draw do

  resources :items
  devise_for :users, controllers: {
      sessions: 'users/sessions' ,
      registrations: 'users/registrations' ,
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'product#index'
  resources :users
  get   '/users_product/:id', to: 'product#users_product'
  get   '/product_status/:id', to: 'product#product_status'
  get '/logout' => 'users#logout'
  get '/users/show/123' => 'users#show'

  resources :card, only: [:new, :show, :index] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
      get 'cards', to: 'card#index'
    end
  end


  resources :product do
    resources :purchase, only: [:index] do
      collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
      get 'confrm', to: 'purchase#confirm'
      end
    end
  end

  get '/profile' => 'users#personal_info'



end
