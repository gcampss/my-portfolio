Rails.application.routes.draw do
  #get 'categories/pages'
  devise_for :users
  root to: 'pages#home'
  resources :categories 

  resources :posts

 

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
