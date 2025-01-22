Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
  end
  devise_for :admins
  root 'homes#top'
  resources :reservations, only: [:new, :create, :show]
  devise_for :users

end
