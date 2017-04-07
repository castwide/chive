class AddStatusToArticles < ActiveRecord::Migration
  def change
    add_column :chive_articles, :status, :string, default: 'publish'
  end
end
