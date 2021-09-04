Rails.application.routes.draw do
  # get 'rooms/show'
  root 'home#index'
  resources :events do
    resources :participations
  end

  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }

  resources :users, only: [:show, :index]
  resources :users do
    resources :rooms
  end
  resources :posts, only: [:create]
  resources :messages, only: [:create]

end
