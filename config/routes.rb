BackboneLabank::Application.routes.draw do
  devise_for :makers
  root 'static#home'
end
