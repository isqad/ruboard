class CreateRuboardViews < ActiveRecord::Migration
  def self.up

    add_column :ruboard_topics, :views_count, :integer, :default => 0

    create_table :ruboard_views do |t|
      t.integer :user_id
      t.integer :viewable_id
      t.string :viewable_type
      t.datetime :current_viewed_at
      t.datetime :past_viewed_at
      t.integer :count, :default => 0
      t.timestamps
    end

    add_index :ruboard_views, [:viewable_id, :viewable_type], :name => 'ruboard_views_viewable_idx'
    add_index :ruboard_views, :user_id
  end

  def self.down
    remove_column :ruboard_topics, :views_count
    drop_table :ruboard_views
  end
end
