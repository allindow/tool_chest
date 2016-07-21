Rails.application.routes.draw do
  # resources :tools

  resources :users, only: [:new, :create, :show] do
    resources :tools
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: 'sessions#new'

  namespace :admin do
    resources :categories
  end

  resources :categories, only: [:show, :index]
end
