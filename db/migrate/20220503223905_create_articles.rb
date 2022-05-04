class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :source
      t.integer :author_id
      t.string :title
      t.string :description
      t.string :url
      t.string :url_to_image
      t.datetime :published_at
      t.timestamps
    end
  end
end
