Rails.application.routes.draw do
  post '/guests/guest_sign_in', to: 'guests#guest_sign_in'
  get '/users/sign_in'
  post '/users/login'
  get '/users/logout'
  get '/workouts/graph'
  get '/workouts/body_weight_graph'
  resources :users, only: [:new, :create, :edit, :update]
  resources :workouts
  resources :workout_menus
  resources :diets
  get '/', to: 'home#top'
end
