Rails.application.routes.draw do
  get 'diet/new'
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
