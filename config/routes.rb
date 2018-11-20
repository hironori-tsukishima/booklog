Rails.application.routes.draw do
  devise_for :users
  root 'contents#index'
  resources :contents do
    resources :comments ,only: [:new , :create]
  end
  resources :users ,only: [:edit,:update]
end
