Rails.application.routes.draw do
  post "/rate" => "rater#create", :as => "rate"
  resources :products do
    resources :comments
  end
  resources :suggests
  resources :carts
  resources :orders
  namespace :admin  do
    root "dashboard#index"
    resources :users
    resources :categories
    resources :products
    resources :dashboard
    resources :orders
    resources :suggests
  end
  devise_for :users, controllers: {omniauth_callbacks:
    "omniauth_callbacks#create"}
  root "products#index"
  get "/home", to: "static_pages#home"
end
