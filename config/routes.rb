Rails.application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  root to: "users#index"
  resources :users do #, :only => [:index, :destroy]
  	resources :images, :only => [:index, :new, :create]
  end
  post "users/:id/images/new" => "images#create"
end
