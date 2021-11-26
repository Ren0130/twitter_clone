Rails.application.routes.draw do
  resources :topics, only: %i[index create] do
    resource :favorite, only: [:create, :destroy]
  end

  get 'topics/explore', to: 'topics#explore', as: 'explore_topics'
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
