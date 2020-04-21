Rails.application.routes.draw do
  root 'projects#index'

  resources :projects
  resources :tickets
  resources :tags, except: [:show]
end
