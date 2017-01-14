TwitterRedRocket::Application.routes.draw do
  devise_for :users
  
  root to: 'tweets#index'

  resources :users, only: [:new, :create, :edit, :update] do
  	member do
      get :following, :followers
    end
    
  	get 'see_tweets' => 'users#see_tweets', as: 'activities'
    get 'see_profile' => 'users#see_profile', as: 'profile'
    post 'follow_user' => 'users#follow_user', as: 'follow'
  end

  resources :tweets, only: [:new, :create]
  resources :relationships, only: [:create, :destroy]
end
