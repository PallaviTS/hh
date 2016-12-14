Rails.application.routes.draw do
  resources :money_rushes
  get '/places', to: 'places#index'
end
