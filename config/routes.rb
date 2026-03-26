Rails.application.routes.draw do
  root 'books#index'

  resources :books
  resources :loans
  resources :users
  resources :approval_requests

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end