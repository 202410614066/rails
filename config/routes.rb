Rails.application.routes.draw do
  devise_for :users

  resources :categories

  get "about", to: "home#about"
  get "projects", to: "home#projects"

  scope ":user_id", as: "user" do
    resource :profile, only: [:new, :create, :show, :edit, :update]
    resources :posts
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index]
  end

  root "home#index"
end
