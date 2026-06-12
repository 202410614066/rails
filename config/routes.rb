Rails.application.routes.draw do
  get "about", to: "home#about"
  get "projects", to: "home#projects"

  resources :posts

  root "posts#index"
end
