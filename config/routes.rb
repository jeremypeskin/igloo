Rails.application.routes.draw do
  resources :units
  resources :properties
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
end
