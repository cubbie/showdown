Rails.application.routes.draw do

  root "players#index"
  resources :players
  resources :users, only: %i(new create)
  resources :sessions, only: %i(new create destroy)
  resources :brackets, only: %i(index new create show)
end
