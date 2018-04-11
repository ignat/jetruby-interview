Rails.application.routes.draw do

  devise_for :users

  resources :appointments do
    resources :reminders
  end

  namespace :api do
    resources :appointments, only: [:index, :create]
  end

  get 'home', to: 'home#index', as: :home
  get 'profile', to: 'home#profile', as: :profile
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
