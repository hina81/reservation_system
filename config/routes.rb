Rails.application.routes.draw do
  get 'reservations/new'
  get 'reservations/create'
  get 'reservations/index'
  get 'reservations/edit'
  get 'reservations/update'
  get 'reservations/destroy'
  root 'homes#top'
  resources :reservations, only: [:new, :create, :index, :edit, :update, :show, :destroy ]
  devise_for :users

end
