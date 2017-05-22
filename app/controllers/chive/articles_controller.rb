require_dependency "chive/application_controller"

module Chive
  class ArticlesController < ApplicationController
    def index
      @articles = live_articles.paginate(page: params[:page], per_page: Chive.per_page)
    end

    def show
      @article = Article.find_by(slug: params[:slug])
      raise ActionController::RoutingError, 'Not Found' if @article.nil?
    end

    def feed
      @articles = live_articles.limit(Chive.per_page)
      respond_to do |format|
        format.rss { render layout: false }
      end
    end

    private

    def live_articles
      Article
        .where('published_at <= ? AND (expired_at >= ? OR expired_at IS NULL) AND status = ?', DateTime.now, DateTime.now, 'publish')
        .order(published_at: :desc)
    end
  end
end
