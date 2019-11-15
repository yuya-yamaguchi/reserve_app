Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  ActiveAdmin.routes(self)
  # devise_for :users
  root 'studios#index'

  resources :reserves, only: [:index]

  resources :studios, only: [:index, :show] do
    resources :reserves, only: [:index, :show, :update]
  end

  resources :users, only: [:show, :edit, :update]

  resources :posts, only: [:index, :show, :edit, :update, :new, :create]
end

