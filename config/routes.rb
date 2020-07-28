Rails.application.routes.draw do
  get 'home/top' => 'home#top'
  get 'about' => "home#about"
  get 'post/create' => "post#create"
  post 'create_action' => "post#create_action"
  get 'post/:id' => "post#show"
  post 'create_user' => "user#create_user"
  get 'user/create' => "user#create"
  get 'database' => "home#database"
  get 'user/login' => "user#login"
  post 'login_action' => "user#login_action"
  post 'user/logout' => "user#logout"
  get 'user/:id' => "user#show"





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
