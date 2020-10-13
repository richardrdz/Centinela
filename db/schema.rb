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

ActiveRecord::Schema.define(version: 20201013042626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.boolean "hidden"
    t.bigint "types_report_id"
    t.bigint "user_id"
    t.text "address"
    t.index ["types_report_id"], name: "index_reports_on_types_report_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "types_reports", force: :cascade do |t|
    t.string "name", null: false
    t.string "img", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hidden"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "userName", null: false
  end

  add_foreign_key "reports", "types_reports"
  add_foreign_key "reports", "users"
end
