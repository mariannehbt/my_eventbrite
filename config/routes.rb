Rails.application.routes.draw do

  root to: 'static_pages#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'index', to: 'static_pages#index'
  get 'secret', to: 'static_pages#secret'
  
  resources :attendances
  resources :events
  resources :users

end
