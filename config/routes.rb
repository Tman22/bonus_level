Rails.application.routes.draw do
  root 'welcome#index'

  resource :user, only: [:new, :create, :show]
end
