Rails.application.routes.draw do
  root "sessions#new"

  get "sessions/new"
  get "users/new"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/month_report", to: "report#month_report"
  post "/login", to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  resources :users
  resources :password_resets, except: %i(destroy index show)
  resources :month_intenses

  get "/admin", to: "admin/dashboard#index"

  namespace :admin do
    resources :users
    resources :savings
    resources :categories
  end
end
