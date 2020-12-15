Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show]
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :favorites, only: [:index, :create, :destroy]
end
