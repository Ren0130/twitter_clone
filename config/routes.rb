Rails.application.routes.draw do
  resources :topics, only: %i[index create] do
    resource :favorite, only: [:create, :destroy]
  end

  get 'topics/explore_latest', to: 'topics#explore_latest', as: 'explore_latest_topics'
  get 'topics/explore_image', to: 'topics#explore_image', as: 'explore_image_topics'
  get 'topics/explore_account', to: 'topics#explore_account', as: 'explore_account_topics'
  get '/topics/:topic_id', to: 'topics#detail', as: 'detail_topics'

  resources :comments, only: :create

  devise_for :users, module: :users
  root "roots#index"

  get 'favorites/index'

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
