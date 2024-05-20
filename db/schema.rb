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

ActiveRecord::Schema[7.0].define(version: 2024_05_20_082126) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "match_stats", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "match_id", null: false
    t.integer "team_score"
    t.integer "overs"
    t.integer "wickets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_match_stats_on_match_id"
    t.index ["team_id"], name: "index_match_stats_on_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "venue"
    t.datetime "match_time"
    t.date "match_date"
    t.integer "overs"
    t.integer "match_no"
    t.bigint "team1_id"
    t.bigint "team2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.string "status"
    t.string "team1_name"
    t.integer "team1_score"
    t.integer "team1_overs"
    t.integer "team1_wickets"
    t.string "team2_name"
    t.integer "team2_score"
    t.integer "team2_overs"
    t.integer "team2_wickets"
    t.index ["team1_id"], name: "index_matches_on_team1_id"
    t.index ["team2_id"], name: "index_matches_on_team2_id"
  end

  create_table "team_players", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_players_on_team_id"
    t.index ["user_id"], name: "index_team_players_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "captain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "status", default: true
    t.string "department"
    t.datetime "birth_date"
    t.string "authentication_token"
    t.string "role", null: false
    t.bigint "team_id"
    t.string "player_type"
    t.string "age"
    t.string "batting_style"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "match_stats", "matches"
  add_foreign_key "match_stats", "teams"
  add_foreign_key "matches", "teams", column: "team1_id"
  add_foreign_key "matches", "teams", column: "team2_id"
  add_foreign_key "team_players", "teams"
  add_foreign_key "team_players", "users"
  add_foreign_key "users", "teams"
end
