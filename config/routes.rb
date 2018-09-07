Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments,only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

  resources :newest, only: :index
  resources :popular, only: :index

  post   '/like/:prototype_id' => 'likes#like',   as: 'like'
  delete '/like/:prototype_id' => 'likes#unlike', as: 'unlike'


end
