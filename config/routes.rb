
Rails.application.routes.draw do
  # SessionsController
  root to: 'sessions#welcome'
  get 'new_session', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'close_session', to: 'sessions#close_session'
  get 'select_baby/:baby_id', to: 'babies#select_baby', as: 'select_baby'
  # post 'update_baby', to: 'babies#update'
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
  get '/users/:user_id/babies', to: 'babies#index', as: 'user_babies'
  post '/users/:user_id/babies', to: 'babies#create'

  get '/users/:user_id/babies/new', to: 'babies#new', as: 'new_user_baby'
  get '/users/:user_id/babies/:id/edit', to: 'babies#edit', as: 'edit_user_baby'

  get '/users/:user_id/babies/:id', to: 'babies#show', as: 'user_baby'
  patch '/users/:user_id/babies/:id', to: 'babies#update'
  put '/users/:user_id/babies/:id', to: 'babies#update'
  delete '/users/:user_id/babies/:id', to: 'babies#destroy'

  # FeedsController
  get	'/users/:user_id/babies/:baby_id/feeds', to: 'feeds#index', as: 'user_baby_feeds'
  post '/users/:user_id/babies/:baby_id/feeds', to: 'feeds#create'

  get '/users/:user_id/babies/:baby_id/feeds/new', to: 'feeds#new', as: 'new_user_baby_feed'
  get '/users/:user_id/babies/:baby_id/feeds/:id/edit', to: 'feeds#edit', as: 'edit_user_baby_feed'

  get '/users/:user_id/babies/:baby_id/feeds/:id', to: 'feeds#show', as: 'user_baby_feed'
  patch '/users/:user_id/babies/:baby_id/feeds/:id', to: 'feeds#update'
  put '/users/:user_id/babies/:baby_id/feeds/:id', to: 'feeds#update'
  delete '/users/:user_id/babies/:baby_id/feeds/:id', to: 'feeds#destroy'
end
