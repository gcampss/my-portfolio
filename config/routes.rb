Rails.application.routes.draw do
  #get 'categories/pages'
  devise_for :users
  root to: 'pages#home'
  resources :categories 

  resources :posts

end
