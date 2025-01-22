Rails.application.routes.draw do
  get 'reservations/new'
  get 'reservations/create'
  get 'reservations/index'
  get 'reservations/edit'
  get 'reservations/update'
  get 'reservations/destroy'
  get 'homes/top'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
