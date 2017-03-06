Rails.application.routes.draw do
  root 'pages#index'

  get 'bots/crawl'
  get 'bots/index'

  namespace :admin do
    resources :bots
    resources :tweets

    root to: "bots#index"
  end

  get 'crawls/google'
  post 'crawls/google_search'
  get 'tweets/new'
  resources :tweets, only: [:new, :create] do
    collection do
      get 'post'
    end
  end
end
