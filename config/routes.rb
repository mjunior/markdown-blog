Rails.application.routes.draw do
  root 'v1/home#index'
  devise_for :users
  
  namespace :v1, path: '/' do
    resources :articles, only: [:new, :show, :create]
    get '/', to: 'home#index'
    get '/:slug', to: 'home#show', as: :show_article
  end
end
