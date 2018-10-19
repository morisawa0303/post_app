Rails.application.routes.draw do

  get '/' => 'top#top'
  get '/top/description' => 'top#description'

  
  get '/home/' => 'home#index'
  get '/home/post' => 'home#post'
  get '/home/show/:id' => 'home#show'
  

  post '/home/create' => 'home#create'

  get '/user/index' => 'user#index'
  get '/user/signup' => 'user#new'
end
