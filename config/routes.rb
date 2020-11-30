Rails.application.routes.draw do
  devise_for :users
  root to: "prototype#index"
  resources :prototype do
    resources :comment, only: [:create]
    patch 'prototype/:id/comment', to: 'comment#create'
  end
  resources :user, only: :show
end
