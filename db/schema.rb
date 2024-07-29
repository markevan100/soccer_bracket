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

ActiveRecord::Schema[7.0].define(version: 2024_07_27_125012) do
  create_table "group_picks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.json "group_standings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_picks_on_group_id"
    t.index ["user_id"], name: "index_group_picks_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "team_a_id"
    t.integer "team_b_id"
    t.integer "group_id", null: false
    t.datetime "date"
    t.integer "team_a_goals"
    t.integer "team_b_goals"
    t.integer "team_a_yellow_cards"
    t.integer "team_b_yellow_cards"
    t.integer "team_a_red_cards"
    t.integer "team_b_red_cards"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_matches_on_group_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "country"
    t.integer "group_id", null: false
    t.string "flag_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_teams_on_group_id"
  end

  create_table "user_picks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "match_id", null: false
    t.integer "predicted_winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_user_picks_on_match_id"
    t.index ["user_id"], name: "index_user_picks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "group_picks", "groups"
  add_foreign_key "group_picks", "users"
  add_foreign_key "matches", "groups"
  add_foreign_key "teams", "groups"
  add_foreign_key "user_picks", "matches"
  add_foreign_key "user_picks", "users"
end
