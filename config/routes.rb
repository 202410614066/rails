Rails.application.routes.draw do
  resources :categories
  get "about", to: "home#about"
  get "projects", to: "home#projects"

  resources :posts

  root "posts#index"
end
