Rails.application.routes.draw do

  resources :images
  get 'post/index'
  get '/' => 'top#top'
  get '/top/description' => 'top#description'

  
  get '/home' => 'home#index'
  get '/home/post' => 'home#post'
  post '/home/create' => 'home#create'
  get '/home/:id/show' => 'home#show'
 

  get '/user/index' => 'user#index'
  get '/user/signup' => 'user#new'
  get '/user/:id/show' => 'user#show'
  get '/user/:id/edit' => 'user#edit'
  post '/user/create' => 'user#create'
  patch '/user/:id/update' => 'user#update'

  get '/login' => 'user#login_form'
  post '/login' => 'user#login'
  post '/logout' => 'user#logout'
end
