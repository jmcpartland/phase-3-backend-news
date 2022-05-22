class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :author
      t.string :source
      t.integer :source_id
      t.string :title
      t.string :description
      t.string :url
      t.string :url_to_image
      t.datetime :published_at
      t.string :content
      t.timestamps
    end
  end
end
