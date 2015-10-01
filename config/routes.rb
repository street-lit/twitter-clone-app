Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/category'

  get 'welcome/about'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :comments
  resources :tweets
  resources :users

  get 'login',  to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'create_session'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'welcome#index'
end
