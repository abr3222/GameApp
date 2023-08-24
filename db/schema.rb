# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_08_24_070520) do

  create_table "brands", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "parent_brand_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_brand_id"], name: "index_brands_on_parent_brand_id"
  end

  create_table "franchises", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "team_id", null: false
    t.bigint "brand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_franchises_on_brand_id"
    t.index ["team_id"], name: "index_franchises_on_team_id"
  end

  create_table "matches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date"
    t.string "location"
    t.integer "team_home_id"
    t.integer "team_away_id"
    t.integer "score_home"
    t.integer "score_away"
    t.integer "winner_team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.date "date_of_birth"
    t.text "address"
    t.string "phone_number"
    t.string "email"
    t.string "gender"
    t.date "contract_start_date"
    t.date "contract_end_date"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_id"
    t.integer "shirt_number"
    t.boolean "injury_status", default: false
    t.string "social_media_presence"
    t.integer "no_of_followers"
    t.bigint "brand_id"
    t.bigint "franchise_id"
    t.string "specialization"
    t.string "experience"
    t.string "certifications"
    t.string "training_approach"
    t.date "managing_since"
    t.integer "staff_count"
    t.text "leadership_style"
    t.text "strategic_plans"
    t.index ["franchise_id"], name: "index_people_on_franchise_id"
    t.index ["team_id"], name: "index_people_on_team_id"
  end

  create_table "teams", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "city"
    t.string "country"
    t.string "stadium_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "training_sessions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date"
    t.string "location"
    t.string "training_focus"
    t.string "training_goal"
    t.bigint "team_id", null: false
    t.string "trainable_type", null: false
    t.bigint "trainable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_training_sessions_on_team_id"
    t.index ["trainable_type", "trainable_id"], name: "index_training_sessions_on_trainable"
  end

  add_foreign_key "brands", "brands", column: "parent_brand_id", on_delete: :cascade
  add_foreign_key "franchises", "brands"
  add_foreign_key "franchises", "teams"
  add_foreign_key "people", "franchises"
  add_foreign_key "people", "teams"
  add_foreign_key "training_sessions", "teams"
end
