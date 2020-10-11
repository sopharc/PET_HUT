Rails.application.routes.draw do



  ActiveAdmin.routes(self)



  resources :carts, only: [:new, :create, :show, :destroy]
  resources :line_items, only: [:new, :create, :destroy]

  mount StripeEvent::Engine, at: '/stripe-webhooks'


  resources :products, only: [:index, :show]
  resources :blog_posts, only: [:index]

  get 'components', to: 'pages#components'
  get 'contact', to: 'pages#contact'

  root to: 'pages#home', as: :home

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_for :users, skip: :all

  resources :orders do
    resources :payments, only: :new
  end

  resources :customers do
    resources :addresses, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :components

end
