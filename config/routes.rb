Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/history'

  get 'bots/crawl'
  get 'bots/index'

  namespace :admin do
    resources :bots
    resources :tweets

    root to: "bots#index"
  end


  post 'crawls/google_search'
  post 'crawls/twitter_search'
  resources :crawls, only: [:show, :index] do
    member do
      get :google_search
    end
  end
  
  resources :tweets, only: [:create, :show] do
    collection do
      get 'post'
    end
  end
end
