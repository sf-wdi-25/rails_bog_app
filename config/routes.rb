Rails.application.routes.draw do

  #config/routes.rb

  root "creatures#index"

  resources :creatures, only: [:index]


end
