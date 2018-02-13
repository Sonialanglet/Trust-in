Rails.application.routes.draw do


  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  get "/identification", to: "pages#identification", as: :identification_page
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :prestations do
    collection do
      get 'recomanded_prestations'
    end

    member do
      post 'recomandation'
      get 'contact'
    end
    resources :reviews, only: [:create ]
  end





  resources :groups do
    member do
      get :join
    end
  end

  resources :profiles
  resources :categories, only: [:show, :index]
end
