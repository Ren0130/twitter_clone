Rails.application.routes.draw do
  resources :topics, only: %i[index new create]

  devise_for :users, module: :users
  root "roots#index"

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  resources :users, only: [:topics] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get 'topics'
  end



end
