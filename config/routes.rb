Rails.application.routes.draw do
  resources :creatures
  root 'creatures#index'

  get '/creatures', to: 'creatures#index'
  get '/creatures/new', to: 'creatures#new'
  post '/creatures', to: 'creatures#create'
  get '/creatures/:id', to: 'creatures#show'
  get '/creatures/:id/edit', to: 'creatures#edit'
  patch '/creatures/:id', to: 'creatures#update'
  delete '/creatures/:id', to: 'creatures#destroy'

end
