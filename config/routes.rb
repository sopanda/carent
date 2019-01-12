# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  post 'sign_in', to: 'user_token#create'
  post 'sign_up', to: 'users#create'

  resources :users, except: :create

  resources :cars

  resources :bookings do
    resources :reviews
  end
end
