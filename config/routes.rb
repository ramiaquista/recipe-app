Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :recipes
  resources :foods
  resources :recipe_foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"
end
