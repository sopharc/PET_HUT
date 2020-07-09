Rails.application.routes.draw do

  resources :products, only: [:index, :show]

  get 'components', to: 'pages#components'
  devise_for :users

  root to: 'pages#home', as: :home
  devise_for :users

  resources :customers

  resources :orders

  resources :addresses

  resources :components


  get 'components', to: 'pages#components'

end
