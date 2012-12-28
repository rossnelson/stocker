Kozak::Application.routes.draw do

  get "bulk/photo/upload" => "photos#bulk", :as => "bulk_photos"
  match "photos/from/tags" => "searches#photos_from_tags", :as => "photos_from_tags"

  resources :tags
  resources :photos
  resources :photo_uploaders, :only => [:show, :create, :update, :destroy]
  resources :usage_right_uploaders, :only => [:show, :create, :destroy]

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
  root :to => "photos#index"

end
