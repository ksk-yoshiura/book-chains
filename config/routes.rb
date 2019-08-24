Rails.application.routes.draw do
  devise_for :users
  root  'chains#index'
  resources :chains, only: :index
  resources :books, only: [:show, :index]

  resources :users, only: [:show, :index] do
    resources :books
    resources :chains
  end
end
