Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "tweets#index"
  get "/:username", to:"tweets#show", as: "username"
  get "/:username/new", to: "tweets#new", as: "tweets_new"
  post "/:username/new", to: "tweets#create"

  get "/user/picture", to: "users#edit_picture", as: "edit_picture"
  patch "/user/picture", to: "users#update_picture", as: "update_picture"

end
