Rails.application.routes.draw do

  #config/routes.rb

  root to: "creatures#index"

  resources :creatures
end
