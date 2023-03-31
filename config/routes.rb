Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :words, only: [:index]
  # Defines the root path route ("/")
  root to: "words#index"
  # root "articles#index"
  # TODO change the root, so home page has api key option and profile management
  resources :api_keys, only: [:create, :destroy, :index]
end
