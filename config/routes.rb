Rails.application.routes.draw do
  resources :invoices
  resources :expenses
  resources :units
  resources :properties
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
end
