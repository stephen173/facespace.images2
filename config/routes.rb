Rails.application.routes.draw do

  get '/' => 'users#index'

  put '/users/befriend/:id' => 'users#befriend'
  
  post '/make_post' => 'wallposts#create'
  

  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/logout' => 'sessions#destroy'
  get '/login'	=> 'sessions#new'
  post '/login' => 'sessions#create'  

end
