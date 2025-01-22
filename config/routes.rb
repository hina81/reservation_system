Rails.application.routes.draw do
  root 'homes#top'
  resources :reservations, only: [:new, :create, :index, :edit, :update, :show, :destroy ]
  devise_for :users

end
