Rails.application.routes.draw do
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "profile", to: "profile#show", as: :profile
  resources :journals, path: "journal"
  resources :logs
  resources :requirements
  patch "dashboard/hours", to: "dashboard#update_hours"

  root "dashboard#index"

  get "up" => "rails/health#show", as: :rails_health_check
end