Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :pharmacies, only: [:index, :show] do
    resources :bookings, only: [:edit, :update]
  end
  resources :bookings, only: [:create, :edit, :update, :show, :destroy, :new, :index]


  get 'show_pharma_marker/:id', to: 'show_pharma_marker#show', as: 'show_pharma_marker'
  get 'profile', to: 'pages#profile', as: 'profile'

  # Defines the root path route ("/")
  # root "posts#index"
end
