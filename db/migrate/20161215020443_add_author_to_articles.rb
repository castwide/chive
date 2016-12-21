class AddAuthorToArticles < ActiveRecord::Migration
  def change
    add_column :chive_articles, :author_id, :integer, index: true
  end
end
