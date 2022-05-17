Rails.application.routes.draw do
  devise_for :users

  resources :categories
  resources :transactions
  resources :users
  resources :wallets

  get '/dashboard', to: 'dashboards#index', as: :dashboard
  get '/notice', to: 'wallets#clear_message'
end
