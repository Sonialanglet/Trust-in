Rails.application.routes.draw do


  get 'categories/index'

  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :prestations
  resources :groups do
    member do
      get :join
    end
  end

  resources :profiles, only: [:show, :index]
end
