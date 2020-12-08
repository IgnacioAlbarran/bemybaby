Rails.application.routes.draw do

  resources :heights
  resources :weights
  # SessionsController
  root to: 'sessions#welcome'
  get 'new_session', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'close_session', to: 'sessions#close_session'
  get 'select_baby/:baby_id', to: 'babies#select_baby', as: 'select_baby'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # UsersController
  get '/users', to: 'users#index', as: 'users'
  post '/users', to: 'users#create'

  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  get '/users/:id', to: 'users#show', as: 'user'
  put '/users/:id', to: 'users#update'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  # BabiesController
  get '/babies', to: 'babies#index', as: 'babies'
  post '/babies', to: 'babies#create'

  get '/babies/new', to: 'babies#new', as: 'new_baby'
  get '/babies/:id/edit', to: 'babies#edit', as: 'edit_baby'

  get '/babies/:id', to: 'babies#show', as: 'baby'
  patch '/babies/:id', to: 'babies#update'
  put '/babies/:id', to: 'babies#update'
  delete '/babies/:id', to: 'babies#destroy'

  post '/delete_baby/:id', to: 'babies#delete_baby', as: 'delete_baby'

  # FeedsController
  get '/feeds', to: 'feeds#index', as: 'feeds'
  post '/feeds', to: 'feeds#create'

  get '/feeds/new', to: 'feeds#new', as: 'new_feed'
  get '/feeds/:id/edit', to: 'feeds#edit', as: 'edit_feed'

  get '/feeds/:id', to: 'feeds#show', as: 'feed'
  patch '/feeds/:id', to: 'feeds#update'
  put '/feeds/:id', to: 'feeds#update'
  delete '/feeds/:id', to: 'feeds#destroy', as: 'delete_feed'
end
