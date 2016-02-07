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

ActiveRecord::Schema.define(version: 20141117010000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attempts", force: true do |t|
    t.integer  "call_id"
    t.string   "url"
    t.string   "http_code"
    t.string   "http_status"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "attempts", ["call_id"], name: "index_attempts_on_call_id", using: :btree

  create_table "calls", force: true do |t|
    t.integer  "hook_id"
    t.string   "event_type"
    t.json     "data"
    t.string   "status",          default: "pending"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "last_attempt_id"
  end

  add_index "calls", ["hook_id"], name: "index_calls_on_hook_id", using: :btree
  add_index "calls", ["last_attempt_id"], name: "index_calls_on_last_attempt_id", using: :btree

  create_table "hooks", force: true do |t|
    t.string   "url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "last_call_id"
  end

  add_index "hooks", ["last_call_id"], name: "index_hooks_on_last_call_id", using: :btree

end
