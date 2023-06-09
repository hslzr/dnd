Rails.application.routes.draw do
  resources :characters
  resources :races, param: :name, only: [ :show ]
  resources :subraces, param: :name, only: [ :show ]
  resources :player_classes, param: :name, only: [ :show ]

  devise_for :users

  root 'home#index'
  get 'creation/sheet'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
