Rails.application.routes.draw do
  get "pages/about"
  root 'books#index'
  
  resources :books, only: [:index, :show] do
    collection do
      get 'search'
    end
  end

  resources :authors, only: [:index, :show] do
    collection do
      get 'search'
    end
  end

  resources :books, only: [:index, :show]
  resources :authors, only: [:index, :show]

  get 'about', to: 'pages#about'  # New route for the about page

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end

