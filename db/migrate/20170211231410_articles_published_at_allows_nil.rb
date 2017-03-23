class ArticlesPublishedAtAllowsNil < ActiveRecord::Migration
  def change
    change_column :chive_articles, :published_at, :datetime, null: true
  end
end
