Rails.application.routes.draw do
  root 'lists#index'

  resources :lists, only: [:new, :create, :edit, :update, :show]
  resources :categories, only: [:new, :create, :edit, :updates]
end
