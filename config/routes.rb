Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :words
  # Defines the root path route ("/")
  root to: "words#index"
  # root "articles#index"
end
