Rails.application.routes.draw do
  root 'welcome#index'

  resources :projects do
    resources :tickets
  end
end
