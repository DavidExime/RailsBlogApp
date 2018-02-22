Rails.application.routes.draw do
  
  root to: "users#index" 

  get '/users/index'

  get '/users/new'

  get '/users/create'

  get '/users/:id', to: "users#show"

  get '/users/edit'

  get '/users/update'

  get '/users/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
