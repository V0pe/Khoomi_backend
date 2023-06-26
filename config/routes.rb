Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :v1, defaults: { format: 'json' } do
    resources :users, only: [:create ]
    resources :items, only: [:index, :show, :create, :destroy]
    resources :orders, only: [:index, :show, :create, :destroy]
    resources :vendors, only: [:index, :show, :create, :destroy]
    resources :brands, only: [:index, :show, :create, :destroy]
    resources :categories, only: [:index, :show, :create, :destroy]
  end
end
