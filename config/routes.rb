Rails.application.routes.draw do
  resources :recurring_events
  resources :invoices do
    collection do
      put :pay
    end
  end
  resources :expenses
  resources :units
  resources :properties
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
end
