Rails.application.routes.draw do
  get 'members/create'
  devise_for :users
  root to: 'pages#home'

  resources :convoys do
    resources :members, only: :create
  end
  resources :users, only: [:show, :edit, :update]
  resources :members, only: :destroy
end
