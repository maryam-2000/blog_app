Rails.application.routes.draw do
  # Health and PWA routes
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # User authentication routes
  post 'signup', to: 'users#signup'
  post 'login', to: 'users#login'

  # Post and Comment routes
  resources :posts do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:update, :destroy]

  # Root path can be defined as needed
  # root "posts#index"
end
