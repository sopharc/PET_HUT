Rails.application.routes.draw do
  root to: 'pages#home', as: :home
  devise_for :users

  resources :customers do
    resources :orders do
      resources :order_products

  resources :addresses

resources :components do
  resources :products do
    resources :product_materials, only: [:new, :create]


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
  get 'components', to: 'pages#components'

  end
 end
end
