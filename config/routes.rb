Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#home'
  
  get '/products',         to:'products#index'
  get '/products/:id',   to:'products#show'

  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :favorites, only: [:index, :create, :destroy]

  delete :logged_out, to: "sessions#logged_out"
  get :logged_in, to: "sessions#logged_in"
end
