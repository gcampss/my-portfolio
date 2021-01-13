Rails.application.routes.draw do
  #get 'categories/pages'
  devise_for :users
  root to: 'pages#home'
  get "/about", to: "pages#about"
  resources :categories do
    resources :posts, except: [ :index, :show ]
  end
  resources :posts, only: [ :edit, :update, :destroy ]
end
