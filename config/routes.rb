Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :users, only: [:show]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end