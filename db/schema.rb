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

ActiveRecord::Schema.define(version: 20151119021356) do

  create_table "cards", force: :cascade do |t|
    t.integer  "card_number",      limit: 16
    t.string   "card_type"
    t.integer  "expiration_month", limit: 2
    t.integer  "expiration_year",  limit: 4
    t.decimal  "balance",                     default: 0.0
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "cards_users", force: :cascade do |t|
    t.integer "card_id",                   null: false
    t.integer "user_id",                   null: false
    t.boolean "is_shared", default: false
  end

  add_index "cards_users", ["card_id", "user_id"], name: "index_cards_users_on_card_id_and_user_id"
  add_index "cards_users", ["user_id", "card_id"], name: "index_cards_users_on_user_id_and_card_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "phone"
  end

end
