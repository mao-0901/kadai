Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts
  resources :users, only: [:new, :create]
  get    '/welcome', to: "sessions#new",     as: :welcome
  post   '/login',   to: "sessions#create",  as: :login
  delete '/logout',  to: "sessions#destroy", as: :logout
  scope module: :user do
    resources :user do
      resources :posts, only: [:index]
    end
  end
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

