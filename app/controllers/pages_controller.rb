class PagesController < ApplicationController
  def index
  end
  
  def history
    @histories = Crawl.order("created_at desc").page(params[:page])
  end
end
