Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  root to: "application#landing_page"
  resources :users do 
    collection do
    end

    member do
    end
  end

  resources :sessions do 
    collection do 
      post :login
      post :logout
    end

    member do 
    end
  end
  
  resources :books do 
    collection do
      get :available_books
      get :unavailable_books
    end
  end

  resources :welcome

  resources :libraries, only: [:show] do
    collection do
      get :invalid
    end
    
    resources :media_transactions, only: [:new, :create, :index] 
  end



end
