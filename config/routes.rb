Rails.application.routes.draw do
  
  
  
  root  'mains#home'
  get   '/about',    to:'mains#about'
  get   '/contact',  to:'mains#contact'
  
  get   '/signup',   to:'users#new'
  post  '/signup',   to:'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  #resource :categorys 
  resources :rooms
  resources :messages
  get 'roomhome',    to:'rooms#table'
  post 'roomhome',    to:'rooms#create'
  get 'rooms/:room_id' => 'rooms#show'
  get 'homes',         to:'rooms#home'

  get '/note',        to:'rooms#note'
  get '/question',    to:'rooms#qa'
  get '/discussion',  to:'rooms#discuss'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #ルーティングでソケットリクエストが繋げられるルーティングを作る。
  #mount ActionCable.server => "/cable"
end
