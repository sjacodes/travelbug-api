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

ActiveRecord::Schema.define(version: 2018_10_06_153133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blades", force: :cascade do |t|
    t.bigint "wishlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wishlist_id"], name: "index_blades_on_wishlist_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.boolean "within_price_range"
    t.boolean "airport_transfer_available"
    t.boolean "late_checkout_available"
    t.boolean "offers_packages_and_deals"
    t.bigint "blade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blade_id"], name: "index_checklists_on_blade_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.string "website"
    t.string "imageurl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "wishlist_id"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_likes_on_hotel_id"
    t.index ["wishlist_id"], name: "index_likes_on_wishlist_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "text"
    t.bigint "blade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blade_id"], name: "index_notes_on_blade_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

end
