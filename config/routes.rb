Journal::Application.routes.draw do

  get "log_in" => "session#new", :as => "log_in"
  get "log_out" => "session#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"

  get 'account', to: 'accounts#show'

  root :to => "projects#index"

  resource :session, :only => [:new, :create, :destroy], :controller => 'session'

  resources :users do
    resources :accounts
  end

  resources :accounts do
    resources :projects
  end

  resources :projects do
    resources :entries
  end

end
