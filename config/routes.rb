Rails.application.routes.draw do
  mount Delayed::Web::Engine, at: '/jobs'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources :resources, only: [:index, :new, :create, :destroy]

  get "/contacts/new", to: "contacts#new"
  post "/contacts", to: "contacts#create"

  resources :courses do
    resources :lessons
    resources :posts do
      resources :comments
    end
    member do
      get 'generate'
      get 'enroll'
    end
  end

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks', :registrations => "registrations"}
  resources :users, :only => [:show]
  #get 'resources/index'

  #get 'resources/new'

  #get 'resources/create'

  #get 'resources/destroy'

  root "welcome#index"
  get "/home", to:"home#show"
  get "/contacts/new", to:"contacts#new"
  get "/profile", to:"profile#view_profile"
  get "/statistics", to:"statistics#show"
  get "/statistics/generate", to:"statistics#generate"
  mount Rapidfire::Engine => "/rapidfire"
end
