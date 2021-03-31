class AddUniqueSlugToChiveArticles < ActiveRecord::Migration[6.0]
  def change
    add_index :chive_articles, :slug, unique: true
  end
end
