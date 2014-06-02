BackboneLabank::Application.routes.draw do
  root 'static#home'
  devise_for :makers
  ActiveAdmin.routes(self)
end
