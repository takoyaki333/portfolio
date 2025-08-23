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

ActiveRecord::Schema[7.2].define(version: 2025_08_23_133723) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carebit_actions", force: :cascade do |t|
    t.integer "category"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "encouragement_messages", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "health_checks", force: :cascade do |t|
    t.boolean "ok"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_carebit_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "carebit_action_id", null: false
    t.date "performed_on", null: false
    t.integer "status", default: 0, null: false
    t.text "diary_note"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carebit_action_id"], name: "index_user_carebit_logs_on_carebit_action_id"
    t.index ["user_id", "performed_on"], name: "index_user_carebit_logs_on_user_id_and_performed_on", unique: true
    t.index ["user_id", "status", "performed_on"], name: "index_user_carebit_logs_on_user_id_and_status_and_performed_on"
    t.index ["user_id"], name: "index_user_carebit_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "user_carebit_logs", "carebit_actions"
  add_foreign_key "user_carebit_logs", "users"
end
