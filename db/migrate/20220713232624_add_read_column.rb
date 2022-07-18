class AddReadColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :read, :boolean, :default => false
  end
end
