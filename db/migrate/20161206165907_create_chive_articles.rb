class CreateChiveArticles < ActiveRecord::Migration
  def change
    create_table :chive_articles do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.string :byline
      t.datetime :published_at, null: false
      t.datetime :expired_at, null: true
      
      t.timestamps null: false
    end
  end
end
