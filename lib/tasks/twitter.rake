require 'open-uri'
namespace :twitter do
  desc "random_tweet"
  task :tweet => :environment do
    twitter_client
    tweet = Tweet.order('rand()').first
    status = tweet.text
    media = open(tweet.image)
    @client.update_with_media(status, media)
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