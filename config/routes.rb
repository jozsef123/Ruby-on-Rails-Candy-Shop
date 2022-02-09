Rails.application.routes.draw do
  resources :candies, only: [:index, :show, :new, :create, :edit, :update]
  resources :shelves
  resources :shops
  #get 'home/index'
  root  'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
