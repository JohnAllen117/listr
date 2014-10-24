Rails.application.routes.draw do
  root "lists#index"
  resources :users, only: [:new, :create, :show, :destroy]
  resources :lists, only: [:new, :create, :edit, :update, :destroy, :index, :show] do
     resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :likes, only: [:create, :destroy] 
  resources :categories, only: [:new, :create, :edit, :update, :show]
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  get "signout", to: "sessions#destroy", as: "signout"
end

