Rails.application.routes.draw do
  resources :urls
  devise_for :users
  root 'urls#index'
  get '/:hash_value', to: 'urls#redirect', as: 'redirect'
end
