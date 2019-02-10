Rails.application.routes.draw do
  resources :recurring_events
  resources :invoices do
    collection do
      put :pay
    end
  end
  resources :expenses
  resources :units
  resources :properties do
    member do
      post :add_mortgage_payments_to
    end
  end
  resources :dashboard, only: [:index]
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
end
