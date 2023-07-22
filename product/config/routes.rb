Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  # get 'recipes/index'
  # get 'users/index'
  # get 'ingredients/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :ingredients, only: [:index, :new, :create, :show, :edit, :update, :destroy]

end
