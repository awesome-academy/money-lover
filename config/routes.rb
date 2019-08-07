Rails.application.routes.draw do
  root "static_pages#home"

  get "sessions/new"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/month_report", to: "report#month_report"
  get "/admin", to: "admin/dashboard#index"
  get "/year_report", to: "report#year_report"
  get "/recommend", to: "recommend#month_recommend"

  post "/login", to: "sessions#create"
  post "/finances_user", to: "finances_user#create"

  delete "/logout",  to: "sessions#destroy"

  resources :users
  resources :password_resets, except: %i(destroy index show)
  resources :month_intenses, only: %i(new create)
  resources :savings, only: %i(new create)
  resources :categories_user, only: %i(new create index destroy)

  namespace :admin do
    get "/statistic", to: "admin_statistic#index"
    get "/statistic/show", to: "admin_statistic#show"
    get "/users/search", to: "users#search"

    resources :users
    resources :savings
    resources :categories
  end
end
