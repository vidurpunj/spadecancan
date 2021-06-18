Rails.application.routes.draw do
  root to: 'users#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users
  resources :posts
end
