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

ActiveRecord::Schema.define(version: 2019_02_02_160849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "category_lists", force: :cascade do |t|
    t.string "table_title"
    t.string "category_code"
    t.string "category_name"
    t.string "update_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sna_calyears", force: :cascade do |t|
    t.string "period_time"
    t.string "category_code"
    t.string "category_name"
    t.string "date_code"
    t.string "date_name"
    t.integer "$data"
    t.string "$unit"
    t.string "update_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sna_fisyears", force: :cascade do |t|
    t.string "period_time"
    t.string "category_code"
    t.string "category_name"
    t.string "date_code"
    t.string "date_name"
    t.integer "$data"
    t.string "$unit"
    t.string "update_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sna_quarterlies", force: :cascade do |t|
    t.string "period_time"
    t.string "category_code"
    t.string "category_name"
    t.string "date_code"
    t.string "date_name"
    t.integer "$data"
    t.string "$unit"
    t.string "update_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sna_quartery_seasonallies", force: :cascade do |t|
    t.string "period_time"
    t.string "category_code"
    t.string "category_name"
    t.string "date_code"
    t.string "date_name"
    t.integer "$data"
    t.string "$unit"
    t.string "update_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "system_of_national_accounts", force: :cascade do |t|
    t.string "period_time"
    t.string "category_code"
    t.string "category_name"
    t.string "date_code"
    t.string "date_name"
    t.integer "$data"
    t.string "$unit"
    t.string "update_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
