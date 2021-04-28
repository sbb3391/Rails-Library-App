Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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
    end

    member do 
    end
  end

end
