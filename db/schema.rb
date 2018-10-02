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

ActiveRecord::Schema.define(version: 2018_10_02_120311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "body_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "renter_id"
    t.bigint "car_id"
    t.integer "daily_price"
    t.date "start_date"
    t.date "end_date"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_bookings_on_car_id"
    t.index ["renter_id"], name: "index_bookings_on_renter_id"
  end

  create_table "cars", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "make_id"
    t.bigint "model_id"
    t.integer "year"
    t.bigint "body_style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body_style_id"], name: "index_cars_on_body_style_id"
    t.index ["make_id"], name: "index_cars_on_make_id"
    t.index ["model_id"], name: "index_cars_on_model_id"
    t.index ["owner_id"], name: "index_cars_on_owner_id"
  end

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.bigint "make_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["make_id"], name: "index_models_on_make_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "cars"
  add_foreign_key "bookings", "users", column: "renter_id"
  add_foreign_key "cars", "body_styles"
  add_foreign_key "cars", "makes"
  add_foreign_key "cars", "models"
  add_foreign_key "cars", "users", column: "owner_id"
  add_foreign_key "models", "makes"
end
