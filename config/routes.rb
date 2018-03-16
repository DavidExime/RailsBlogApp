Rails.application.routes.draw do
  
  root to: "users#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  root 'pages#home'


  resources :users
  resources :blogs
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
