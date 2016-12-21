class AddAutosummaryToArticles < ActiveRecord::Migration
  def change
    add_column :chive_articles, :autosummary, :boolean
  end
end
