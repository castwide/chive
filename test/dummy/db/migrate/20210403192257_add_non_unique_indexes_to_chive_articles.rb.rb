class AddNonUniqueIndexesToChiveArticles < ActiveRecord::Migration[6.0]
  def change
    add_index :chive_articles, :author_id, unique: false
    add_index :chive_articles, :status, unique: false
    add_index :chive_articles, :published_at, unique: false
    add_index :chive_articles, :expired_at, unique: false
  end
end
