Rails.application.routes.draw do
  get 'bots/crawl'
  get 'bots/index'

  namespace :admin do
    resources :bots
    resources :tweets

    root to: "bots#index"
  end

  root 'tweets#new'
  resources :tweets, only: [:new, :create] do
    collection do
      get 'post'
    end
  end
end
