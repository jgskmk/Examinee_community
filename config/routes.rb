Rails.application.routes.draw do
  root "home#top"
  resources :studytimes
  resources :meetings
  get 'meetings_all' => 'meetings#meetings_all'
  get 'studytimes_all' => 'studytimes#studytimes_all'
  get 'home/top/:page' => 'home#top'
  get 'about' => "home#about"
  get 'search/:page' => "home#search"
  get 'post/create' => "post#create"
  post 'create_post' => "post#create_post"
  get 'post/update/:id' => "post#update"
  post 'update_post/:id' => "post#update_post"
  delete 'post/destroy/:id' => "post#destroy"
  get 'post/:id' => "post#show"
  post 'create_user' => "user#create_user"
  get 'user/create' => "user#create"
  delete 'user/destroy' => "user#destroy"
  get 'database' => "home#database"
  get 'user/login' => "user#login"
  post 'login_user' => "user#login_user"
  delete 'logout' => "user#logout"
  get 'user/:id' => "user#show"
  post 'update_user/:id' => "user#update_user"
  get 'user/update/:id' => "user#update"
  post 'like/create/:id' => "like#create"
  post 'like/destroy/:id' => "like#destroy"




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
