# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  post 'sign_in', to: 'user_token#create'
  post 'sign_up', to: 'users#create'

  resources :users, except: :create do
    resources :reviews, module: 'users'
  end

  resources :cars do
    resources :reviews, module: 'cars'
  end

  resources :bookings

  namespace :admin do
    # admin routes
  end
end
