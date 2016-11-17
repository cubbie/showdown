Rails.application.routes.draw do

  root "players#index"
  resources :players

  get '/brackets' => 'players#brackets'

end
