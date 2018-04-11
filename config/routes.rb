Rails.application.routes.draw do



  devise_for :users,
      controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated :user do
          root 'prestations#index', as: :authenticated_root
  end

  root to: 'pages#home'
  get "/identification", to: "pages#identification", as: :identification_page
  get "/network", to: "pages#network", as: :network_page

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:index, :show, :edit, :update ]

  resources :prestations do
    collection do
      get 'recomanded_prestations'


    end

    member do
      post 'recomandation'
    end
    resources :reviews, only: [:create ]
    resources :bookings, only: [:new, :create]
  end

  resources :groups, param: :user_id do
    member do
      get :add_user_to_principal
      delete :remove_user_from_principal
    end
  end



  resources :groups do
    member do
      get :want_join
      get :accept_join
    end
  end

  resources :bookings, only: [:index,:show, :destroy] do
    resources :answers
   end

  resources :categories, only: [:show, :index]
  resources :posts do
    resources :replies
  end
end
