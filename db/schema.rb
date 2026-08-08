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

ActiveRecord::Schema[8.1].define(version: 2026_08_08_014229) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "journals", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_journals_on_user_id"
  end

  create_table "logs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date_worked"
    t.decimal "hours"
    t.time "time_in"
    t.time "time_out"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.string "status"
    t.datetime "updated_at", null: false
    t.datetime "uploaded_at"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_requirements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.integer "hours_completed"
    t.string "password_digest"
    t.integer "total_hours_required"
    t.datetime "updated_at", null: false
    t.string "username"
  end

  add_foreign_key "journals", "users"
  add_foreign_key "logs", "users"
  add_foreign_key "requirements", "users"
end
