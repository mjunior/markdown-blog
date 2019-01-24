require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  root 'v1/home#index'
  devise_for :users

  namespace :v1, path: '/' do
    resources :articles
    get '/', to: 'home#index'
    get '/:slug', to: 'home#show', as: :show_article
  end
end
