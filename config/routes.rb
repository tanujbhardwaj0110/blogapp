Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  get "/signup" , to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/user_posts", to: "users#posts"
  get "/posts/:id/softdelete", to: "posts#softdelete"
  resources :users ,except: [:new]
  resources :posts do
    resources :comments
  end
end
