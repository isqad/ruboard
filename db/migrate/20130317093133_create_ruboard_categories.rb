class CreateRuboardCategories < ActiveRecord::Migration
  def change
    create_table :ruboard_categories do |t|

      t.string :title, :null => false
      t.boolean :published, :null => false, :default => true
      t.string :slug, :null => false
      t.timestamps
    end
    add_index :ruboard_categories, :slug, :unique => true
  end
end
