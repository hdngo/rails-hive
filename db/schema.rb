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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150729235850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bumblebees", force: :cascade do |t|
    t.text     "username"
    t.text     "email"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendrequests", force: :cascade do |t|
    t.text     "status",       default: "pending"
    t.integer  "bumblebee_id"
    t.integer  "friend_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "friendrequests", ["bumblebee_id"], name: "index_friendrequests_on_bumblebee_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "bumblebee_id"
    t.integer  "friend_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "friendships", ["bumblebee_id"], name: "index_friendships_on_bumblebee_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "uploader"
    t.string   "url"
    t.string   "caption"
    t.integer  "bumblebee_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "photos", ["bumblebee_id"], name: "index_photos_on_bumblebee_id", using: :btree

  add_foreign_key "friendrequests", "bumblebees"
  add_foreign_key "friendships", "bumblebees"
  add_foreign_key "photos", "bumblebees"
end
