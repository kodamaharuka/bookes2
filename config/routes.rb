Rails.application.routes.draw do
  devise_for :users, module: "users"
  root to: 'homes#top'
  resources :books
  resources :users, only: [:index, :show, :edit, :new, :create, :update]
  get '/homes/about', to: 'homes#about'

end