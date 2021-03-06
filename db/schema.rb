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

ActiveRecord::Schema.define(version: 2021_04_23_093244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "babies", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.date "dob"
    t.string "gender"
    t.string "blood_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["user_id"], name: "index_babies_on_user_id"
  end

  create_table "checkups", force: :cascade do |t|
    t.bigint "baby_id"
    t.date "date"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_checkups_on_baby_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.date "date"
    t.time "hour"
    t.integer "mililitres"
    t.bigint "baby_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_feeds_on_baby_id"
  end

  create_table "heights", force: :cascade do |t|
    t.bigint "baby_id"
    t.integer "height"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_heights_on_baby_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.integer "level", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.datetime "deleted_at"
  end

  create_table "weights", force: :cascade do |t|
    t.bigint "baby_id"
    t.integer "weight"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_weights_on_baby_id"
  end

  add_foreign_key "checkups", "babies"
end
