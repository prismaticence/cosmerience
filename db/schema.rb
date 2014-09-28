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

ActiveRecord::Schema.define(version: 20140928002413) do

  create_table "comments", force: true do |t|
    t.text     "body",       limit: 255
    t.integer  "review_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "comments", ["ancestry"], name: "index_comments_on_ancestry"

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.text     "body",                limit: 255
    t.integer  "cost"
    t.boolean  "recommend"
    t.integer  "user_id"
    t.integer  "treatment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "doctor"
    t.string   "clinic_location"
    t.text     "doctor_review"
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
    t.string   "slug"
  end

  create_table "treatments", force: true do |t|
    t.string   "name"
    t.text     "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_url"
    t.string   "slug"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
  end

end
