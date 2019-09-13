Rails.application.routes.draw do
  devise_for :users
  
  root  'chains#index'
  
  resources :chains, only: [:show, :index] do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :users, only: [:show, :index] do
    resources :books
    resources :chains, except: [:edit, :update]
  end
end