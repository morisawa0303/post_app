Rails.application.routes.draw do

  get '/' => 'top#top'
  get '/top/description' => 'top#description'

  
  get '/home' => 'home#index'
  get '/home/post' => 'home#post'
  post '/home/create' => 'home#create'
  get '/home/show/:id' => 'home#show'
 

  get '/user/index' => 'user#index'
  get '/user/signup' => 'user#new'
  get '/user/show/:id' => 'user#show'
  get '/user/edit/:id' => 'user#edit'
  post '/user/create' => 'user#create'
  post '/user/update' => 'user#update'

  get '/login' => 'user#login_form'
  post '/login' => 'user#login'
  post '/logout' => 'user#logout'
end
