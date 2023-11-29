Rails.application.routes.draw do
  resources :urls
  devise_for :users
  root 'urls#index'
end
