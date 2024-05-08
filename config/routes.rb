Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :users, only: [:index, :edit, :show, :update]
  resources :books, only: [:index, :edit, :show, :create, :destroy, :update]
  resources :groups, only: [:new, :index, :edit, :show, :create, :update] do
    resource :group_users, only: [:create, :destroy]
    get 'new/mail' => 'groups#new_mail'
    get 'send/mail' => 'groups#send_mail'
  end

  get 'home/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
