class CreateRuboardTopics < ActiveRecord::Migration
  def change
    create_table :ruboard_topics do |t|
      t.integer :forum_id, :null => false
      t.integer :user_id, :null => false
      t.boolean :closed, :null => false, :default => false
      t.boolean :pinned, :null => false, :default => false

      t.timestamps
    end
  end
end
