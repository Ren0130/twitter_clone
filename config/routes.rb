Rails.application.routes.draw do
  resources :topics, only: %i[index new create]
  devise_for :users, module: :users
  root "roots#index"
end
