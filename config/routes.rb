Rails.application.routes.draw do
  
  
  
  root  'mains#home'
  get   '/about',    to:'mains#about'
  get   '/contact',  to:'mains#contact'
  
  get   '/signup',   to:'users#new'
  post   '/signup',   to:'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resource :categorys 
  resources :rooms
  get 'rooms/new'
  post 'mkroom', to:'rooms#create'
  get 'rooms/:room_id' => 'rooms#discuss'
  get 'rooms/home'

  get '/note',        to:'rooms#note'
  get '/question',    to:'rooms#qa'
  get '/roomhome',    to:'rooms#table'
  get '/discussion',  to:'rooms#discuss'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
