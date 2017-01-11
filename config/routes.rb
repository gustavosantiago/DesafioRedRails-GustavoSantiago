TwitterRedRocket::Application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tweets#index'

  resources :users do
  	member do
      get :following, :followers
    end
    
  	get 'see_tweets' => 'users#see_tweets', as: 'activities'
  end
end
