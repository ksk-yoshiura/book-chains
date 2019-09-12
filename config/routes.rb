Rails.application.routes.draw do
  devise_for :users
  
  root  'chains#index'
  
  resources :chains, only: [:show, :index] do
    resources :likes, only: [:create, :destroy]
  end

  resources :books, only: [:show, :index]

  resources :users, only: [:show, :index] do
    resources :books
    resources :chains, except: [:edit, :update]
  end
end