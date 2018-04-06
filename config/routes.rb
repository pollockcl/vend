Rails.application.routes.draw do
  get 'snacks/show'

  root to: "owners#index"

  resources :owners do
    resources :machines, only: [:index]
  end

  resources :machines, only: [:show]

  resources :snacks, only: [:show]
end
