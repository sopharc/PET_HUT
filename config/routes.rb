Rails.application.routes.draw do
  resources :products, only: [:index, :show]

  get 'components', to: 'pages#components'
  devise_for :users
  root to: 'pages#home', as: :home
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
