class CreateChiveArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :chive_articles do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.string :custom_byline
      t.text :summary
      t.boolean :autosummary
      t.integer :author_id
      t.string :status
      t.datetime :published_at
      t.datetime :expired_at

      t.timestamps
    end
  end
end
