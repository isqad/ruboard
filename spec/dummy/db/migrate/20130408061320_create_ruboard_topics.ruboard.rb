# This migration comes from ruboard (originally 20130317093433)
class CreateRuboardTopics < ActiveRecord::Migration
  def change
    create_table :ruboard_topics do |t|
      t.string :title, :null => false
      t.integer :forum_id, :null => false
      t.integer :user_id, :null => false
      t.boolean :closed, :null => false, :default => false
      t.boolean :pinned, :null => false, :default => false
      t.string :slug

      t.timestamps
    end

    add_index :ruboard_topics, :forum_id
    add_index :ruboard_topics, :user_id
    add_index :ruboard_topics, :slug, :unique => true
  end
end
