Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#home'
  
  get '/products',         to:'products#index'
  get '/products/:name',   to:'products#show'
end
