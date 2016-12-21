class ChangeBylineToCustomBylineInArticles < ActiveRecord::Migration
  def change
    rename_column :chive_articles, :byline, :custom_byline
  end
end
