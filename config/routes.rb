Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create, :show]
  # resource :user rachel is sure.
  namespace :admin do
    resources :users, only: [:show]
  end

  resources :articles

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
