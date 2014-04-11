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

ActiveRecord::Schema.define(:version => 20140410093553) do

  create_table "friends", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_with"
    t.boolean  "request_accepted"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "friends", ["user_id"], :name => "index_friends_on_user_id"

  create_table "likes", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "likes", ["post_id"], :name => "index_likes_on_post_id"
  add_index "likes", ["user_id"], :name => "index_likes_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "status"
    t.string   "image"
    t.integer  "user_id"
    t.boolean  "comment"
    t.integer  "post_id"
    t.string   "number_of_likes"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.date     "date_of_birth"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
