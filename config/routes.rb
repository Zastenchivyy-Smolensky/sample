Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users
  resources :products do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users do
    resources :relationships, only: [:create, :destroy]
    get 'follows', on: :member
    get 'followers', on: :member
  end
end