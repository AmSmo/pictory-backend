Rails.application.routes.draw do
  resources :comments
  resources :user_photos
  resources :user_locations
  resources :location_photos
  resources :photos do
    get :photograph, on: :member  
  end
  resources :locations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
