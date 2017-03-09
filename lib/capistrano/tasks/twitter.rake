require 'open-uri'
namespace :twitter do
  desc "random_tweet"
  task :tweet => :environment do
    tweets = Crawl.all
    tweets.each do |tweet|
        if tweet.method == 1
          status = tweet.title + "が更新されました！　from Google" + tweet.link
        end
        
        if tweet.method == 2
          status = tweet.name + "さん" + tweet.text + "from Twitter" 
        end
        twitter_client
        @client.update(status)
    end
  end
end

def twitter_client
    @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "HxTbIelBlbjp56cERilNt6XEy"
    config.consumer_secret     = "mzrDSM4WkFC23cx1TRQPrQ4p2AT0Yt1RxYpojAcD5Ua7RZZPWA"
    config.access_token        = "732909452563619845-ptSOidEhCvXBPGCWUF6KoOqrFRcJAJ4"
    config.access_token_secret = "x7m24zjdrJyhe1w8dmt5paIPEgfnSTmrCjLXJ8CnASjQd"
    end
end