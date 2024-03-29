Rails.application.routes.draw do
  resources :checkups
  resources :heights
  resources :weights
  # SessionsController
  root to: 'sessions#welcome'
  get '/test_point', to: 'sessions#test_point'
  get 'new_session', to: 'sessions#new', as: 'new_session'
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

  # MeasuresController
  get '/measures', to: 'measures#index', as: 'measures'

  # WeightsController
  post '/weights', to: 'weights#create'
  get '/weights/:id/edit', to: 'weights#edit'
  put '/weights/:id', to: 'weights#update'
  delete '/weights/:id', to: 'weights#destroy', as: 'delete_weight'

  # HeightsController
  post '/heights', to: 'heights#create'
  get '/heights/:id/edit', to: 'heights#edit'
  put '/heights/:id', to: 'heights#update'
  delete '/heights/:id', to: 'heights#destroy', as: 'delete_height'

  # VaccinesController
  get '/vaccines', to: 'vaccines#index', as: 'vaccines'

  # Control
  get '/control/index', to: 'controls#index'
  get '/control/users', to: 'controls#users', as: 'users_control'
end
