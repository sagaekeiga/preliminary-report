Rails.application.routes.draw do
  get 'pages/index'

  get 'bots/crawl'
  get 'bots/index'

  namespace :admin do
    resources :bots
    resources :tweets

    root to: "bots#index"
  end

  get 'crawls/google'
  root 'tweets#new'
  resources :tweets, only: [:new, :create] do
    collection do
      get 'post'
    end
  end
end
