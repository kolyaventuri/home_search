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

ActiveRecord::Schema.define(version: 2018_05_29_170806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "homes", force: :cascade do |t|
    t.string "spark_id"
    t.string "mls_id"
    t.decimal "list_price"
    t.string "address"
    t.decimal "total_baths"
    t.decimal "total_beds"
    t.decimal "garage_spaces"
    t.decimal "lot_size"
    t.decimal "sqft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_line_address"
    t.string "hero_shot"
    t.string "hero_shot_small"
  end

end
