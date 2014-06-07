BackboneLabank::Application.routes.draw do
  root 'static#home'
  resources :accounts, only: [:index]
  devise_for :makers
  ActiveAdmin.routes(self)
end
