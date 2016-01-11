Rails.application.routes.draw do
  root to: "creatures#index"

  get "/creatures", to: "creatures#index", as: "creatures"
  get "/creatures/new", to: "creatures#new", as: "new_creature"
  post "/creatures" => "creatures#create"
  get "/creatures/:id" => "creatures#show", as: "creature"
  
end
