#
#config/routes.rb
#


Rails.application.routes.draw do
  root "creatures#index"

  get "/creature", to: "creatures#index", as: "creatures"
  
end
