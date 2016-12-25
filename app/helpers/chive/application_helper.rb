module Chive
  module ApplicationHelper
    def article_list limit: 10, partial: 'chive/articles/list'
      Article.where('published_at <= ? AND (expired_at >= ? OR expired_at IS NULL)', DateTime.now, DateTime.now).order(published_at: :desc).limit(limit)
    end
  end
end
