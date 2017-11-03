Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :posts do
    resources :comments
  end

  resources :resources, only: [:index, :new, :create, :destroy]
  
  get "/contacts/new", to: "contacts#new"
  post "/contacts", to: "contacts#create"
  
  resources :courses do
    resources :lessons
    member do

      get 'generate'
      get 'enroll'

    end
  end

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  #get 'resources/index'

  #get 'resources/new'

  #get 'resources/create'

  #get 'resources/destroy'

  root "welcome#index"
  get "/home", to:"home#show"
  get "/contacts/new", to:"contacts#new"
  get "/profile", to:"profile#view_profile"
  get "/statistics", to:"statistics#show"
  get "/searches", to:"searches#show"
  mount Rapidfire::Engine => "/rapidfire"
end
