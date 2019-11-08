Rails.application.routes.draw do
  root 'studios#index'

  resources :studios, only: [:index, :show] do
    resources :reserves, only: [:index, :show, :update]
  end
end

