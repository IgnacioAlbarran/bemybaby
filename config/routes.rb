Rails.application.routes.draw do
  root to: 'sessions#welcome'
  get 'new_session', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'close_session', to: 'sessions#close_session'
  resources :users do
    resources :babies do
      resources :feeds
    end
  end
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
  get '/babies', to: 'babies#index', as: 'user_babies'
  post '/babies', to: 'babies#create'

  get '/babies/new', to: 'babies#new', as: 'new_user_baby'
  get '/babies/:id/edit', to: 'babies#edit', as: 'edit_user_baby'

  get '/babies/:id', to: 'babies#show', as: 'user_baby'
  patch '/babies/:id', to: 'babies#update'
  put '/babies/:id', to: 'babies#update'
  delete '/babies/:id', to: 'babies#destroy'

  # FeedsController
  get	'/feeds', to: 'feeds#index', as: 'user_baby_feeds'
  post '/feeds', to: 'feeds#create'

  get '/feeds/new', to: 'feeds#new', as: 'new_user_baby_feed'
  get '/feeds/:id/edit', to: 'feeds#edit', as: 'edit_user_baby_feed'

  get '/feeds/:id', to: 'feeds#show', as: 'user_baby_feed'
  patch '/feeds/:id', to: 'feeds#update'
  put '/feeds/:id', to: 'feeds#update'
  delete '/feeds/:id', to: 'feeds#destroy'
end
