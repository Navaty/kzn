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

ActiveRecord::Schema.define(version: 20191122134309) do

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
    t.index ["sale_id"], name: "index_discounts_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_sales_on_ancestry"
  end

end
