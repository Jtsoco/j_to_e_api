Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :words, only: [:index]
  # Defines the root path route ("/")
  # root to: "words#index"
  # root "articles#index"
  # TODO change the root, so home page has api key option and profile management
  resources :api_keys, only: [:create, :index]
  delete '/api_keys', to: 'api_keys#destroy'
  # Note: commented out path doesn't require id, resources path requires id
  # delete '/api-keys', to: 'api_keys#destroy'
end
