Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create, :destroy]

  get '/login', to: 'sessions#login', as: 'login'
  post '/login', to: 'sessions#user_login'
  delete '/logout', to: 'sessions#logout', as: 'logout'

end
