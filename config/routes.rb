Rails.application.routes.draw do
  root 'home#index'
  post 'login', to: 'user_token#create'
  post 'registration', to: 'users#create'

  resources :users, except: :create
  resources :cars do
    scope module: 'cars' do
      resource :status, only: :update, controller: 'status'
    end
  end
  resources :bookings
end
