Rails.application.routes.draw do

  root "players#index"
  resources :players
  resources :users, only: %i(new create)
  get '/brackets' => 'players#brackets'

end
