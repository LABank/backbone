BackboneLabank::Application.routes.draw do
  root 'static#home'
  resources :accounts, only: [:index]
  resources :transfers, only: [:new, :create]
  devise_for :makers
  ActiveAdmin.routes(self)
end
