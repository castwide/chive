require_dependency "chive/application_controller"

module Chive
  class ArticlesController < ApplicationController

    def index
      @articles = Article.where('published_at <= ? AND (expired_at >= ? OR expired_at IS NULL)', DateTime.now, DateTime.now).order(published_at: :desc).paginate(page: params[:page], per_page: Chive.per_page)
    end

    def show
      @article = Article.find_by(slug: params[:slug])
    end

  end
end
