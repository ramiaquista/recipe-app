Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :recipes
  resources :foods
  resources :recipe_foods

  root "recipes#index"
  delete '/foods/:id', to: 'food#destroy', as: "delete_food"
  get '/public_recipes', to: 'recipes#public_recipes', as: "public_recipes"
end
