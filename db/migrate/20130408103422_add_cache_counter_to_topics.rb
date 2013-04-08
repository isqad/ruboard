class AddCacheCounterToTopics < ActiveRecord::Migration
  def self.up
    add_column :ruboard_topics, :posts_count, :integer, :default => 0

    Ruboard::Topic.reset_column_information
    Ruboard::Topic.find_each do |t|
      Ruboard::Topic.update_counters t.id, :posts_count => t.posts.length
    end
  end

  def self.down
    remove_column :ruboard_topics, :posts_count
  end
end
