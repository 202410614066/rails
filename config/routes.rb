Rails.application.routes.draw do
  devise_for :users

  resources :categories

  get "about", to: "home#about"
  get "projects", to: "home#projects"

  scope ":user_id", as: "user" do
    resource :profile, only: [:new, :create, :show, :edit, :update]
  end

  resources :posts

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  root "posts#index"
end
