class CreateRuboardForums < ActiveRecord::Migration
  def change
    create_table :ruboard_forums do |t|
      t.integer :category_id, :null => false
      t.string :title, :null => false, :length => 250
      t.string :description, :length => 300
      t.boolean :published, :null => false, :default => true

      t.integer :parent_id
      t.integer :lft, :null => false
      t.integer :rgt, :null => false
      t.integer :depth

      t.timestamps
    end
    add_index :ruboard_forums, :category_id
    add_index :ruboard_forums, :lft
    add_index :ruboard_forums, :rgt
    add_index :ruboard_forums, :parent_id
  end
end
