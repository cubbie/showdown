Rails.application.routes.draw do

  root "players#index"
  resources :players
  resources :users, only: %i(new)
  get '/brackets' => 'players#brackets'

end
