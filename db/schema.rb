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

ActiveRecord::Schema.define(version: 20141111060742) do

  create_table "items", force: true do |t|
    t.string   "content"
    t.integer  "task_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "completed_at"
  end

  add_index "items", ["task_list_id"], name: "index_items_on_task_list_id"

  create_table "memberships", force: true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["team_id"], name: "index_memberships_on_team_id"
  add_index "memberships", ["user_id", "team_id"], name: "index_memberships_on_user_id_and_team_id", unique: true
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "task_lists", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.integer  "user_id"
  end

  add_index "task_lists", ["team_id"], name: "index_task_lists_on_team_id"
  add_index "task_lists", ["user_id"], name: "index_task_lists_on_user_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email"

end
