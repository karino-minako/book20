Rails.application.routes.draw do
  root 'books#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'home/about' => "books#about"
  resources :books

  resources :users
end