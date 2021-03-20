Rails.application.routes.draw do
  devise_for :users, module: "users"
  root to: 'homes#top'
  resources :books
  resources :users
end