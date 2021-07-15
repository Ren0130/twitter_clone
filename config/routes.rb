Rails.application.routes.draw do
  devise_for :users
  root "roots#index"
  resources :users
end
