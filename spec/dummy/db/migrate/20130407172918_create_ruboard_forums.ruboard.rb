# This migration comes from ruboard (originally 20130317091811)
class CreateRuboardForums < ActiveRecord::Migration
  def change
    create_table :ruboard_forums do |t|

      t.string :title, :null => false, :length => 250
      t.string :description, :length => 300
      t.boolean :published, :null => false, :default => true
      t.string :slug

      t.timestamps
    end

    add_index :ruboard_forums, :slug, :unique => true
  end
end
