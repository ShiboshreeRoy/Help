Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, only: [:create]
    resource :like, only: [:create, :destroy]
  end

  resources :follows, only: [:create, :destroy]
  root "posts#index"
end
