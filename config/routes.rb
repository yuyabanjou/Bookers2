Rails.application.routes.draw do

  root to: 'home#home'

  get 'home/about' => 'home#about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only: [:show, :edit, :update, :index]
end
