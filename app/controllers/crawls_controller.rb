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
    
end
