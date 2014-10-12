Rails.application.routes.draw do
  root "lists#index"
  resources :users, only: [:new, :create, :show]
  resources :lists, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :categories, only: [:new, :create, :edit, :updates]

  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  get "signout", to: "sessions#destroy", as: "signout"
end
