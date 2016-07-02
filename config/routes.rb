Rails.application.routes.draw do

 root "static_pages#home"
  
  resources :attractions
  resources :users

  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  post "/rides/new", to: "rides#new"


end