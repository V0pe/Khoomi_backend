Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :v1, defaults: { format: 'json' } do
    resources :users, only: [:create ]
    resources :items, only: [:index, :show, :create, :destroy]
    resources :orders, only: [:index, :show, :create, :destroy]
    resources :vendors, only: [:index, :show, :create, :destroy]
    resources :brands, only: [:index, :show, :create, :destroy]
    resources :categories, only: [:index, :show, :create, :destroy]
  end
end
