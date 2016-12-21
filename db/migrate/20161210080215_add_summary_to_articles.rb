class AddSummaryToArticles < ActiveRecord::Migration
  def change
    add_column :chive_articles, :summary, :text
  end
end
