# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_22_210410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.integer "player1_id"
    t.integer "player2_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stock_picks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.integer "quantity"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_stock_picks_on_stock_id"
    t.index ["user_id"], name: "index_stock_picks_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.string "ticker"
    t.integer "initial_value"
    t.integer "current_value"
    t.integer "initial_quantity"
    t.integer "current_quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "wealth", default: 5000
    t.string "about_me"
    t.string "photo_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "stock_picks", "stocks"
  add_foreign_key "stock_picks", "users"
end
