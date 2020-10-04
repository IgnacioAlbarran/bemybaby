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
end
