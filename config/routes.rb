

Rails.application.routes.draw do
  resources :users
  resources :likes
  resources :posts
  resources :comments
  # get 'pages/index'
  root 'pages#index'

end
