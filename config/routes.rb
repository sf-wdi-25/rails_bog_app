Rails.application.routes.draw do
  root to: "creatures#index"

  get "/creatures", to: "creatures#index"
  get "/creatures/new", to: "creatures#new"

end
