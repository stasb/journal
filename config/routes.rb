Journal::Application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"

  get 'account', to: 'accounts#show'

  root :to => "projects#index"

  resources :sessions

  resources :users do
    resources :accounts
  end

  resources :accounts do
    resources :projects
  end

  resources :projects
end
