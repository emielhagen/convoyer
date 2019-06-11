Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :convoys do
    resources :favorite_convoys, only: [:create]
    resources :members, only: :create
    resources :reviews, only: :create
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :members, only: :destroy
  resources :favorite_convoys, only: :destroy

  get 'kitchensink', to: 'pages#kitchensink'
end
