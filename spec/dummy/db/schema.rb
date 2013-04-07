# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130407172918) do

  create_table "ruboard_forums", :force => true do |t|
    t.string   "title",                         :null => false
    t.string   "description"
    t.boolean  "published",   :default => true, :null => false
    t.string   "slug"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "ruboard_forums", ["slug"], :name => "index_ruboard_forums_on_slug", :unique => true

  create_table "ruboard_posts", :force => true do |t|
    t.integer  "user_id",                   :null => false
    t.integer  "topic_id",                  :null => false
    t.text     "body",                      :null => false
    t.integer  "edit_times", :default => 0, :null => false
    t.integer  "rating",     :default => 0, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "ruboard_posts", ["topic_id"], :name => "index_ruboard_posts_on_topic_id"
  add_index "ruboard_posts", ["user_id"], :name => "index_ruboard_posts_on_user_id"

  create_table "ruboard_topics", :force => true do |t|
    t.integer  "forum_id",                      :null => false
    t.integer  "user_id",                       :null => false
    t.boolean  "closed",     :default => false, :null => false
    t.boolean  "pinned",     :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "ruboard_topics", ["forum_id"], :name => "index_ruboard_topics_on_forum_id"
  add_index "ruboard_topics", ["user_id"], :name => "index_ruboard_topics_on_user_id"

end
