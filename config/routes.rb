Rails.application.routes.draw do
  resources :recurring_events
  resources :invoices
  resources :expenses
  resources :units
  resources :properties
  devise_for :users
  get 'welcome/index'

  root 'properties#index'
end
