class CrawlsController < ApplicationController

require 'open-uri'
require 'uri'
require 'cgi'

    def google
        escaped_url = URI.escape("https://www.google.com/search?q=クローラー&oe=utf-8&hl=ja")
        doc = Nokogiri::HTML(open(escaped_url))
        
        # 検索結果の数
        puts doc.xpath("//*[@id='resultStats']/text()")
        doc.xpath('//h3/a').each do |link|
        	CGI.parse(link[:href])["adurl"]
        	@google = Crawl.new
        	p @google.url = link[:href]
        	@google.save!
        end
        @googles = Crawl.all
    end
    
    def google_search
        p word =  params[:word][:word]
        
        api_key = 'AIzaSyAQTBu3pAbJXrE-Aj0FKtWB2DgdYuS3Gjg'
        custom_search_engine_id = '012614141905426910993:soqe6qtvyzu'
        search_word = URI.encode("#{word}")
        url = "https://www.googleapis.com/customsearch/v1?key=#{api_key}&cx=#{custom_search_engine_id}&q=#{search_word}"
        
        json = JSON.load(open(url))
        json['items'].each do |item|
           @tweet = Tweet.new
           p @tweet.title = item['title']
           p @tweet.link = item['link']
           @tweet.save!
        end
        @tweets = Tweet.all
        post
    end
    
  def post
    tweet = Tweet.last
    p status = tweet.title + "が更新されました！" + tweet.link
    twitter_client
    @client.update(status)
  end
  
  def twitter_client
    @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "HxTbIelBlbjp56cERilNt6XEy"
    config.consumer_secret     = "mzrDSM4WkFC23cx1TRQPrQ4p2AT0Yt1RxYpojAcD5Ua7RZZPWA"
    config.access_token        = "732909452563619845-ptSOidEhCvXBPGCWUF6KoOqrFRcJAJ4"
    config.access_token_secret = "x7m24zjdrJyhe1w8dmt5paIPEgfnSTmrCjLXJ8CnASjQd"
    end
  end
    
end
