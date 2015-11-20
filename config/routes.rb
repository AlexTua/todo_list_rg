Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :ui, only: [:index, :create, :destroy]

  root  'ui#index'	
  match '/signup',  		to: 'users#new',            via: 'get'

  match '/signin',  		to: 'sessions#new',         via: 'get'
  match '/signout', 		to: 'sessions#destroy',     via: 'delete'

  match 'ui/create',		to: 'ui#create',			via: 'post'
  match 'ui/destroy/:id',	to: 'ui#destroy',			via: 'delete'
end
