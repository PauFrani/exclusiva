Rails.application.routes.draw do
  devise_for :users
  root to: 'biddings#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :biddings, only: [:new, :create, :update] do
      collection do
        get 'category'
        get 'brands'
        get 'location'
      end
    end
    resources :products, only: [:index, :show]

  get '/cards', to: 'pages#cards'

end
