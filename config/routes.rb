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

    resources :showroom_variant_stocks, only: [:index, :show] do
      resources :purchases, only: :new
    end

    resources :purchases, only: :show

    resources :products, only: :show

  get '/cards', to: 'pages#cards'

end
