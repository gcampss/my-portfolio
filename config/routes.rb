Rails.application.routes.draw do
  #get 'categories/pages'
  devise_for :users
  root to: 'categories#index'
  resources :categories, except: :new do
  end
  resources :posts, only: [:show, :create, :destroy] do
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
