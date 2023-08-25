Rails.application.routes.draw do
  get 'elb/health_check'
  get '/healthcheck', to: proc { [200, {}, ['']] } # healthcheck
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  get '/health_check' => 'elb#health_check'
  root to: 'recipes#index'
  # get 'recipes/index'
  # get 'users/index'
  # get 'ingredients/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users, only: [:index]
  resources :ingredients, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :recipe_ingredients
    resources :recipe_methods
  end

end
