Rails.application.routes.draw do
  devise_for :users
  root to: "cars#index"
  resources :cars, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  get "dashboard", to: "profiles#dashboard"
  get "dashboard-my-car", to: "profiles#my_car"
  get "dashboard-booking", to: "profiles#booking"
  delete "dashboard-booking/:id", to: "profiles#destroy_booking", as: "destroy_booking"
  post "dashboard-booking/:id/accept", to: "profiles#accept_request", as: "accept_request"
  post "dashboard-booking/:id/decline", to: "profiles#decline_request", as: "decline_request"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
