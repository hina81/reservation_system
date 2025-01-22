Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
    
    resources :reservations, only: [:index, :show, :destroy] do
      member do
        patch :toggle_status
      end
    end
  end
  devise_for :admins

  root 'reservations#new'

  resources :reservations, only: [:new, :create]
  get 'reservation_complete', to: 'reservations#complete', as: 'reservation_complete'  # 完了画面

  get '/home', to: 'homes#top', as: 'home_top'

  devise_for :users

end
