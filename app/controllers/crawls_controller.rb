class CrawlsController < ApplicationController

require 'open-uri'
require 'uri'
require 'cgi'
    
    ##検索結果を全てtwitterに即座に表示
    def google_search
        @q        = Crawl.search(params[:q])
        p word =  params[:crawl][:keyword]
        api_key = 'AIzaSyAQTBu3pAbJXrE-Aj0FKtWB2DgdYuS3Gjg'
        custom_search_engine_id = '012614141905426910993:soqe6qtvyzu'
        search_word = URI.encode("#{word}")
        url = "https://www.googleapis.com/customsearch/v1?key=#{api_key}&cx=#{custom_search_engine_id}&q=#{search_word}"
        
        json = JSON.load(open(url))
        json['items'].each do |item|
           @crawl = Crawl.new
             @crawl.keyword = word
             @crawl.title = item['title']
             @crawl.link = item['link']
             @crawl.date = Date.today
             @crawl.name = ""
             @crawl.text = ""
             @crawl.geo = ""
             @crawl.method = 1
           @crawl.save!
        end
        @google_search = Crawl.all
    end
    
    def twitter_search
        @q        = Crawl.search(params[:q])
        config = {
        	:consumer_key => 'HxTbIelBlbjp56cERilNt6XEy',
        	:consumer_secret => 'mzrDSM4WkFC23cx1TRQPrQ4p2AT0Yt1RxYpojAcD5Ua7RZZPWA',
        	:access_token => '732909452563619845-ptSOidEhCvXBPGCWUF6KoOqrFRcJAJ4',
        	:access_token_secret => 'x7m24zjdrJyhe1w8dmt5paIPEgfnSTmrCjLXJ8CnASjQd'
        }
        
        twClient = Twitter::REST::Client.new(config)
        
        word1 =  params[:word][:word1]
        word2 =  params[:word][:word2]
        word3 =  params[:word][:word3]
        word_sum = word1 + word2 + word3
    
        # word を含む tweet を 10 件取得する
        results = twClient.search(word_sum, :count => 100, :result_type => "recent")
    
        results.attrs[:statuses].each do |tweet|
          @tweet = Crawl.new
          @tweet.keyword = word_sum
          @tweet.title = ""
          @tweet.link = ""
          @tweet.method = 2
          @tweet.date = Time.parse(tweet[:created_at])
          @tweet.user_id = tweet[:id]
          @tweet.name = "@" + tweet[:user][:screen_name]
          @tweet.text = tweet[:text]
          @tweet.geo = tweet[:user][:location]
          @tweet.save!
        end
        
        @tweets = Crawl.all
    end
    
  def post
    tweets = Tweet.all
    tweets.each do |tweet|
        p status = tweet.title + "が更新されました！" + tweet.link
        twitter_client
        @client.update(status)
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
  
  def show
     @crawl = Crawl.find(params[:id])
     @q        = Crawl.search(params[:q])
  end
  
  def index
    #@products = Product.all
    @q        = Crawl.search(params[:q])
    @crawls = @q.result(distinct: true).order("created_at desc").page(params[:page])
  end
    

end
