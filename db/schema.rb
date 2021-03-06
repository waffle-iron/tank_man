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

ActiveRecord::Schema.define(version: 20170420004315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fish", force: :cascade do |t|
    t.string  "name"
    t.string  "breed"
    t.string  "temperament"
    t.string  "image_url"
    t.string  "description"
    t.integer "tank_id"
    t.index ["tank_id"], name: "index_fish_on_tank_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string  "place_id"
    t.string  "body"
    t.integer "score"
    t.integer "user_id"
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "tanks", force: :cascade do |t|
    t.string  "name"
    t.integer "size"
    t.string  "style"
    t.string  "description"
    t.integer "user_id"
    t.string  "image_url"
    t.index ["user_id"], name: "index_tanks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "image_url"
  end

  create_table "water_parameters", force: :cascade do |t|
    t.float    "ph"
    t.float    "ammonia"
    t.float    "nitrate"
    t.float    "nitrite"
    t.integer  "water_change"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "tank_id"
    t.index ["tank_id"], name: "index_water_parameters_on_tank_id", using: :btree
  end

  add_foreign_key "fish", "tanks"
  add_foreign_key "reviews", "users"
  add_foreign_key "tanks", "users"
  add_foreign_key "water_parameters", "tanks"
end
