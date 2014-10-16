Rails.application.routes.draw do
  root "lists#index"
  resources :users, only: [:new, :create, :show, :destroy]
  resources :lists, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :categories, only: [:new, :create, :edit, :updates]
  resources :likes, only: [:create, :destroy]

  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  get "signout", to: "sessions#destroy", as: "signout"
end
