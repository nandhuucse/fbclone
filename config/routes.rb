Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts
  # root to:"main#index"
  root to:"posts#index"

  get "signup", to:"register#new"
  post "signup", to:"register#create"

  get "signin", to:"session#new"
  post "signin", to:"session#create"

  put "/post/:id/like", to: 'posts#like', as: 'like'
  post "/comment/create", to: 'comments#create', as: 'comment'

  get "/profile/:id/edit", to:"register#edit", as:'edit'
  patch "/profile/:id/update", to:"register#update", as:"update"

  get "/profile", to:"profile#index"
  get "/profile/:id", to:"profile#userProfile", as:"userprofile"
  post "/profile/:id/follow", to:"profile#follow", as:"follow"

  delete "logout", to:"session#destroy"
end
