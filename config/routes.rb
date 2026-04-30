Rails.application.routes.draw do
  get "about", to: "home#about"
  get "project", to: "home#project"

  resources :posts
end
