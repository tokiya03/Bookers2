Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  get 'users/show'
  get 'books/index'
  get 'books/edit'
  get 'books/show'
  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
