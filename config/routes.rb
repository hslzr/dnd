Rails.application.routes.draw do
  resources :characters


  devise_for :users

  root 'home#index'
  get 'creation/sheet'
  get 'races/index'
  get 'races/show'
  get 'subraces/index'
  get 'subraces/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
