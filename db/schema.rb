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

ActiveRecord::Schema.define(version: 2018_09_30_081359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.text "street"
    t.string "city"
    t.string "zip"
    t.string "state"
    t.bigint "storage_unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["storage_unit_id"], name: "index_addresses_on_storage_unit_id"
  end

  create_table "amenities", force: :cascade do |t|
    t.string "category"
    t.text "feature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storage_unit_amenities", force: :cascade do |t|
    t.bigint "storage_unit_id"
    t.bigint "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_storage_unit_amenities_on_amenity_id"
    t.index ["storage_unit_id"], name: "index_storage_unit_amenities_on_storage_unit_id"
  end

  create_table "storage_units", force: :cascade do |t|
    t.string "name"
    t.decimal "rating"
    t.text "about"
    t.text "contact_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_amenities", force: :cascade do |t|
    t.bigint "unit_id"
    t.bigint "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_unit_amenities_on_amenity_id"
    t.index ["unit_id"], name: "index_unit_amenities_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.integer "length"
    t.integer "breadth"
    t.integer "quantity"
    t.decimal "rate"
    t.text "offer"
    t.bigint "storage_unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["storage_unit_id"], name: "index_units_on_storage_unit_id"
  end

  add_foreign_key "addresses", "storage_units"
  add_foreign_key "storage_unit_amenities", "amenities"
  add_foreign_key "storage_unit_amenities", "storage_units"
  add_foreign_key "unit_amenities", "amenities"
  add_foreign_key "unit_amenities", "units"
  add_foreign_key "units", "storage_units"
end
