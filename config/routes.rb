Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes, only: [:index, :new, :create, :show, :destroy] do
    resources :comments,only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]


  resources :prototypes, only: [:index, :new, :create, :show, :destroy] do
  end
  resources :users, only: [:show, :edit, :update] do
  end

  resources :newest, only: :index
  resources :popular, only: :index

  post   '/like/:prototype_id' => 'likes#like',   as: 'like'
  delete '/like/:prototype_id' => 'likes#unlike', as: 'unlike'


end
