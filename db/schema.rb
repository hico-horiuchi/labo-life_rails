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

ActiveRecord::Schema.define(version: 20140514040934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attends", force: true do |t|
    t.integer  "user_id",       default: 0,  null: false
    t.integer  "seminor_id",    default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state",         default: 0,  null: false
    t.text     "absent_reason", default: ""
  end

  create_table "comments", force: true do |t|
    t.text     "content",    default: "", null: false
    t.integer  "user_id",    default: 0,  null: false
    t.integer  "report_id",  default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.integer  "attend_id",  default: 0,  null: false
    t.string   "caption",    default: "", null: false
    t.text     "abstract",   default: "", null: false
    t.string   "document"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    default: 0,  null: false
    t.integer  "seminor_id", default: 0,  null: false
  end

  create_table "seminors", force: true do |t|
    t.integer  "chairman_user_id",              null: false
    t.integer  "created_user_id",               null: false
    t.string   "caption",          default: "", null: false
    t.integer  "state",            default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_at",                      null: false
    t.datetime "end_at",                        null: false
    t.string   "place",            default: "", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",           default: "", null: false
    t.string   "name",            default: "", null: false
    t.string   "student_no",      default: "", null: false
    t.string   "password_digest"
    t.integer  "state",           default: 0,  null: false
    t.integer  "grade",           default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["student_no"], name: "index_users_on_student_no", unique: true, using: :btree

end
