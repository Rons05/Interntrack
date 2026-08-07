Rails.application.routes.draw do
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "profile", to: "profile#show", as: :profile
  get "journal", to: "journals#index", as: :journal
  get "logs", to: "logs#index", as: :logs
  get "requirements", to: "requirements#index", as: :requirements


  root "dashboard#index"

  get "up" => "rails/health#show", as: :rails_health_check
end