Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :users, :only => [:show]
 
resources :events do
  resources :event_attendees, :only => [:create,:destroy]
end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
