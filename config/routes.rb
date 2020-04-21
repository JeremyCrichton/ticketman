Rails.application.routes.draw do
  root 'projects#index'

  get '/register', to: 'users#new'

  resources :projects
  resources :tickets
  resources :tags, except: [:show]
  resources :users, only: [:show, :create, :edit, :update]
end
