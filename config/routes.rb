Rails.application.routes.draw do
  root 'squirrels#index'


  resources :squirrels

  resources :users
  # resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

 get '/squirrel-hats', to: 'squirrels#squirrel_hats'
end
