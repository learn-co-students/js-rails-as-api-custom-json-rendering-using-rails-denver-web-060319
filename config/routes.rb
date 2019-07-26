Rails.application.routes.draw do
  resources :sightings
  resources :birds, only: [:index, :show]
end