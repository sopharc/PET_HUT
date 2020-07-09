Rails.application.routes.draw do
  root to: 'pages#home', as: :home
  devise_for :users

  resources :customers

  resources :orders

  resources :addresses

  resources :components

  resources :products

  get 'components', to: 'pages#components'

end
