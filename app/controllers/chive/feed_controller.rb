module Chive
  class FeedController < ApplicationController
    def index
      @articles =  Article.latest_published.limit(10) # @todo Chive.per_page
      respond_to do |format|
        format.rss { render layout: false }
      end
    end
  end
end
