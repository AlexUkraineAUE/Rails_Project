Rails.application.routes.draw do
  get 'home', to: 'home#index'

  get 'about', to: 'about#index'
  get 'games', to: 'games#index'
  get 'teams', to: 'teams#index'
  get 'genres', to: 'genres#index'

  resources :games, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  resources :reviews, only: [:index, :show]
  resources :teams, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  resources :genres, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
