Rails.application.routes.draw do
  get '/users/sign_in'
  post '/users/login'
  get '/users/logout'
  get '/workouts/graph'
  resources :users, only: [:new, :create, :edit, :update]
  resources :workouts
  get '/', to: 'home#top'
end

