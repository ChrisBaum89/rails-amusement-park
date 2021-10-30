Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'

  #login/logout
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'


  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides
  resources :users, only: [:new, :create, :show]
end
