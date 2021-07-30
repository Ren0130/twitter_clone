Rails.application.routes.draw do
  get 'topics/new'
  devise_for :users, module: :users
  root "roots#index"
end
