Rails.application.routes.draw do
  get 'customer/new' to 'customer#new'
  get 'customer/edit' to 'customer#edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
