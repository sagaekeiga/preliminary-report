class BotsController < ApplicationController
  
    def crawl
        @bots = Bot.all#登録した情報を全て取得
        
        
        @bots.each do |bot|
            doc = Nokogiri::HTML(open("#{bot.url}"))#URLの指定
            @crawls = doc.xpath("#{bot.xpath}").inner_html#xpathの情報を抽出
        end
            
    end
    
    def index
    end
end
