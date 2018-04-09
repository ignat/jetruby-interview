Rails.application.routes.draw do
  devise_for :users

  # TODO: set default home page for devise redirects
  # root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
