class AddImageToArticles < ActiveRecord::Migration
  def change
    add_attachment :chive_articles, :image
  end
end
