Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"

  resources :books, only: [:new, :show, :create, :index, :edit, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :show, :index, :update]




  get 'home/about' => 'homes#about', as: 'about'
end

