Rails.application.routes.draw do
  root 'home#index'
  post 'auth', to: 'user_token#create'
end
