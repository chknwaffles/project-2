Rails.application.routes.draw do
  get '/', to: 'application#index', as: 'index'
  post '/ratings', to: 'songs#post_rating', as: 'post_rating'
  patch '/ratings', to: 'songs#edit_rating', as: 'edit_rating'

  resources :users, only: [:show, :new, :create, :destroy]

  resources :artists, only: [:index, :show] do
    resources :songs, only: [:show, :index]
    resources :albums, only: [:show]
  end
  
  post '/search', to: 'artists#search_artist', as: 'search_artist'

  #login/logout routes
  get '/login', to: 'sessions#login', as: 'login'
  post '/login', to: 'sessions#user_login'
  delete '/logout', to: 'sessions#logout', as: 'logout'


end
