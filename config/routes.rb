Rails.application.routes.draw do

  root "creatures#index"
  
  get "/creatures", to: "creatures#index"
  get "/creatures/new", to: "creatures#new"
end