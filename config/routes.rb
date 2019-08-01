Rails.application.routes.draw do
  root "static_pages#home"

  get "savings/new"
  get "sessions/new"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/month_report", to: "report#month_report"
  get "/admin", to: "admin/dashboard#index"
  get "/year_report", to: "report#year_report"
  post "/login", to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  resources :users
  resources :password_resets, except: %i(destroy index show)
  resources :month_intenses
  resources :month_intenses, only: %i(new create)
  resources :savings, only: %i(new create)

  namespace :admin do
    get "/statistic", to: "admin_statistic#index"
    get "/statistic/show", to: "admin_statistic#show"

    resources :users
    resources :savings
    resources :categories
  end
end
