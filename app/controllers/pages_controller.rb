class PagesController < ApplicationController
  def index
  end
  
  def history
    @q        = Crawl.search(params[:q])
    @histories = Crawl.order("created_at desc").page(params[:page])
  end
end
