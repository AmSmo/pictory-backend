Rails.application.routes.draw do
  resources :comments
  resources :user_photos
  resources :user_locations
  resources :location_photos
  resources :photos do
    get :photograph, on: :member  
  end
  post '/myphotos', to: "photos#myphotos"
  resources :locations
  resources :users
  delete '/unfollow', to: "user_locations#unfollow"
  post '/mylocations', to: "user_locations#my_locations"
  post '/locations/search', to: 'locations#search'
  delete '/logout', to: 'sessions#logout'
  post '/login', to: 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
