# This migration comes from ruboard (originally 20130316133922)
class CreateRuboardPosts < ActiveRecord::Migration
  def change
    create_table :ruboard_posts do |t|
      t.integer :user_id, :null => false
      t.integer :topic_id, :null => false
      t.text :body, :null => false
      t.integer :edit_times, :null => false, :default => 0
      t.integer :rating, :null => false, :default => 0
      t.timestamps
    end
    add_index :ruboard_posts, :user_id
    add_index :ruboard_posts, :topic_id
  end
end
