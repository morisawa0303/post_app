Rails.application.routes.draw do

  get '/' => 'top#top'
  get '/top/description' => 'top#description'

  
  get '/home' => 'home#index'
  get '/home/post' => 'home#post'
  post '/home/create' => 'home#create'
  get '/home/show/:id' => 'home#show'
 

  get '/user/index' => 'user#index'
  get '/user/signup' => 'user#new'
  post '/user/create' => 'user#create'

  get '/login' => 'user#login_form'
  post '/login' => 'user#login'
end
