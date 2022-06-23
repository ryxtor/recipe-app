Rails.application.routes.draw do
  root 'public_recipes#index'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }
  devise_scope :user do
    get '/sign_out', to: 'devise/sessions#destroy'
  end

  resources :food, only: [:index, :destroy, :create]
  resources :shopping_list, only: [:index]
  resources :recipes, only: [:index, :new, :create, :destroy, :show] do
    resources :recipe_foods, only: [:create, :destroy, :new, :edit, :update]
  end

  match 'recipes/:recipe_id' => 'recipes#toggle_public', as: :toggle_public, via: :patch

  resources :inventories, only: [:index, :new, :create, :destroy, :show] do
    resources :inventory_foods, only: [:create, :destroy, :new, :edit, :update]
  end
end
