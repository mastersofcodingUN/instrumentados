Rails.application.routes.draw do
  #get 'resources/index'

  #get 'resources/new'

  #get 'resources/create'

  #get 'resources/destroy'

  resources :resources, only: [:index, :new, :create, :destroy]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get "/contact", to:"contact#form"
  get "/home", to:"home#show"
end
