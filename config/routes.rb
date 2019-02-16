# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  post 'sign_in', to: 'user_token#create'
  post 'sign_up', to: 'users#create'

  get 'unverified_users', to: 'users#unverified'
  get 'profile',          to: 'users#profile'
  get 'my_cars',          to: 'cars#user_cars'
  get 'my_orders',        to: 'cars#my_orders'
  get 'my_loans',         to: 'cars#my_loans'

  resources :users, except: :create do
    scope module: 'users' do 
      get 'verify', to: 'verifications#verify'
      get 'reject', to: 'verifications#reject'
      resources :reviews
    end
  end
  
  scope module: 'users' do
    post 'add_verify_document', to: 'verifications#create'

    resources :booking_requests, only: %i[index show] do
      get 'approve', to: 'booking_requests#approve'
      get 'decline', to: 'booking_requests#decline'
    end
  end

  resources :cars do
    scope module: "cars" do
      put 'update_photo', to: 'photos#update'
      post 'activate',    to: 'availability#activate'
      post 'deactivate',  to: 'availability#deactivate'
      resources :booking_requests, only: %i[index create destroy]
      resources :reviews
    end
  end

  resources :bookings, only: %i[index show] do
    get 'finish', to: 'bookings#finish'
  end

  namespace :admin do
    # admin routes
  end
end
