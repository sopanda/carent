Rails.application.routes.draw do
  root 'home#index'
  post 'login', to: 'user_token#create'
  post 'registration', to: 'users#create'

  resources :users, except: [:create]
  resources :cars
end
