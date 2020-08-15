Rails.application.routes.draw do


  ActiveAdmin.routes(self)
  get 'order/new'
  get 'order/create'
  get 'order/edit'
  get 'order/update'
  get 'order/destroy'
  get 'user/new'
  get 'user/create'
  get 'user/edit'
  get 'user/update'
  get 'user/destroy'
  get 'customer/new', to: 'customer#new'
  get 'customer/edit', to: 'customer#edit'

  resources :carts, only: [:new, :create, :show, :destroy]
  resources :line_items, only: [:new, :create, :destroy]


  resources :products, only: [:index, :show]

  get 'components', to: 'pages#components'

  root to: 'pages#home', as: :home

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_for :users, skip: :all


  resources :customers do
    resources :orders
    resources :addresses, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :components

end
