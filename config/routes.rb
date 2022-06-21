Rails.application.routes.draw do
  root 'users#index'
  get '/users/:id/', to: 'recipes#index'
  get '/users/:id/recipes/:id', to: 'recipes#show'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }
  devise_scope :user do
    get '/sign_out', to: 'devise/sessions#destroy'
  end
end
