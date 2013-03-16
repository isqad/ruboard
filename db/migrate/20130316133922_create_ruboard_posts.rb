class CreateRuboardPosts < ActiveRecord::Migration
  def change
    create_table :ruboard_posts do |t|

      t.timestamps
    end
  end
end
