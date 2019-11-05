Rails.application.routes.draw do
  devise_for :users
  root to: 'biddings#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :biddings, only: [:new, :create, :update]
  get 'biddings/category', to: 'biddings#category'
  get 'biddings/brands', to: 'biddings#brands'
  get 'biddings/location', to: 'biddings#location'
end
