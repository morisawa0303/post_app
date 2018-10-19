Rails.application.routes.draw do
  get '/' => 'top#top'
  get '/top/description' => 'top#description'

  get '/home/show' => 'home#show'
  get '/home/post' => 'home#post'

  post '/home/create' => 'home#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
