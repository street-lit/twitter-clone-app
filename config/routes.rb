Rails.application.routes.draw do

  get 'welcome/index'

  resources :tweets
  resources :comments, only: [:create]
  resources :users,    only: [:new, :create]

  get  'login',  to: 'sessions#new',     as: 'login'
  post 'login',  to: 'sessions#create',  as: 'create_session'
  get  'logout', to: 'sessions#destroy', as: 'logout'

  root 'welcome#index'
end
