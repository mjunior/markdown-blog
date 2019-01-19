Rails.application.routes.draw do
  root 'v1/articles#index'
  devise_for :users
  
  namespace :v1, path: '/' do
    get 'articles/index'
    get 'articles/show'
  end
end
