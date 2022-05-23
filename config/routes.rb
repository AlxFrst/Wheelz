Rails.application.routes.draw do
  devise_for :users
  root to: "cars#index"
  resources :cars, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :profiles, only: [:dashboard]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
