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

  scope module: 'users' do
    resources :booking_requests, only: %i[index show] do
      get 'approve', to: 'booking_requests#approve'
      get 'decline', to: 'booking_requests#decline'
    end
  end

  resources :cars do
    scope module: "cars" do
      post 'activate',   to: 'availability#activate'
      post 'deactivate', to: 'availability#deactivate'
      resources :booking_requests, only: %i[index create destroy]
      resources :reviews
    end
  end

  resources :bookings, only: %i[index show]

  namespace :admin do
    # admin routes
  end
end
