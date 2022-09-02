

Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
    resources :comments, only: [:index, :show]
  end

  root 'pages#index'

end
