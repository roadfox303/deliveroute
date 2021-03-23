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

ActiveRecord::Schema.define(version: 2021_03_23_060759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "route_spots", force: :cascade do |t|
    t.bigint "route_id"
    t.bigint "spot_id"
    t.time "arrival"
    t.integer "volume"
    t.text "memo"
    t.integer "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival"], name: "index_route_spots_on_arrival"
    t.index ["route_id"], name: "index_route_spots_on_route_id"
    t.index ["sequence"], name: "index_route_spots_on_sequence"
    t.index ["spot_id"], name: "index_route_spots_on_spot_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "sequence"
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "tel"
    t.string "memo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_spots_on_address"
    t.index ["name"], name: "index_spots_on_name"
    t.index ["user_id"], name: "index_spots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "route_spots", "routes"
  add_foreign_key "route_spots", "spots"
  add_foreign_key "routes", "users"
  add_foreign_key "spots", "users"
end
