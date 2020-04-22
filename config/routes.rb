Rails.application.routes.draw do
  root 'projects#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  resources :projects
  resources :tags, except: [:show]
  resources :users, only: [:show, :create, :edit, :update]
  resources :tickets do
    resources :comments
  end
end
