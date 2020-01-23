
Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :index]
  post   '/like/:tweet_id' => 'likes#like',   as: 'like'
  delete '/like/:tweet_id' => 'likes#unlike', as: 'unlike'
  post 'welcome/guest' => 'welcome#guest'
  root to: 'welcome#index'
  get 'favorite/index' => 'favorite#index'

end