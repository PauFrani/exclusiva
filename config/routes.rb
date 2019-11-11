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
      collection do
        get 'unique'
      end
      resources :purchases, only: [:new, :create]
    end

    resources :purchases, only: [:show, :index] do
      get '/confirm_payment', to: 'purchases#confirm_payment'
      post '/make_payment', to: 'purchases#make_payment'
    end

    resources :products, only: :show

  get '/cards', to: 'pages#cards'

end
