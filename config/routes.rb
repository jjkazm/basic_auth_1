Rails.application.routes.draw do
  root 'static_pages#home'
  get "signup", to: "users#new", as: "sign"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  post "login", to: "sessions#create", as: "post_login"
  resources :users
  resources :sessions


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
