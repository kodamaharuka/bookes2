Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books
  resources :users, only: [:index, :show, :edit, :new, :create, :update]
  get '/home/about', to: 'homes#about'

end