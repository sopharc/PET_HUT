Rails.application.routes.draw do
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
  devise_for :users
  root to: 'pages#home', as: :home
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
