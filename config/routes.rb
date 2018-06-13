Rails.application.routes.draw do




  mount ForestLiana::Engine => '/forest'
  devise_for :users,
      controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated :user do
          root 'prestations#index', as: :authenticated_root
  end

  root to: 'pages#home'
  get "/identification", to: "pages#identification", as: :identification_page




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:index, :show, :edit, :update ] do

    member do
      get :edit2
      #get :edit_list_school
      end
  end

  resources :prestations do
    collection do
      get 'recomanded_prestations'
      get 'search'

    end

    member do
      post 'recomandation'
      delete 'cancel_recomandation'
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
    resources :users, controller: :groups do
      put :accept_join
      put :refuse_join
    end
    member do
      get :want_join, :not_want_join
      get :firstnetwork
    end
  end

  resources :bookings, only: [:index,:show, :destroy] do
    resources :answers
   end

  resources :categories, only: [:show, :index]
  resources :school_children, only: [:show, :index]
  resources :posts do
    resources :replies
  end
end
