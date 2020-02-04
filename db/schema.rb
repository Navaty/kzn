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

ActiveRecord::Schema.define(version: 20200130112620) do

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "discount_addresses", force: :cascade do |t|
    t.integer "discount_id"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_id"], name: "index_discount_addresses_on_discount_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.date "end_time"
    t.string "adress"
    t.integer "offer"
    t.boolean "active"
    t.integer "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "images"
    t.integer "adwpos"
    t.index ["sale_id"], name: "index_discounts_on_sale_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_events_on_ancestry"
  end

  create_table "places", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "adress"
    t.date "start_time"
    t.date "end_time"
    t.integer "event_id"
    t.boolean "active", default: false, null: false
    t.boolean "free", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "images"
    t.integer "adwpos"
    t.index ["event_id"], name: "index_places_on_event_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "tiding_id"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "images"
    t.integer "adwpos"
    t.index ["tiding_id"], name: "index_posts_on_tiding_id"
  end

  create_table "sales", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_sales_on_ancestry"
  end

  create_table "sliders", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "tidings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_tidings_on_ancestry"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
