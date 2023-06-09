Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"

  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  resources :users,only: [:index, :show, :edit, :update]

  # get 'books/index'
  # get 'users/show'
  # get 'books/edit'
  resources :books,only: [:new, :create, :index, :show, :edit, :destroy]
  patch 'books/:id' => 'books#update', as: 'update_book'
end
