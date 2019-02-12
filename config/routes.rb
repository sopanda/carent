# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  post 'sign_in', to: 'user_token#create'
  post 'sign_up', to: 'users#create'
  
  get 'profile', to: 'users#profile'
  get 'my_cars', to: 'cars#user_cars'
  
  resources :users, except: :create do
    resources :reviews, module: 'users'
  end

  resources :booking_requests, only: %i[index show], module: 'users'

  resources :cars do
    resources :booking_requests, module: 'cars', only: %i[index create destroy]
    resources :reviews, module: 'cars'
  end

  resources :bookings, only: %i[index show]

  namespace :admin do
    # admin routes
  end
end
