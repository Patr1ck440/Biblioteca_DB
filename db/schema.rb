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

ActiveRecord::Schema[8.1].define(version: 2026_03_26_074356) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "approval_requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "loan_id", null: false
    t.text "notes"
    t.string "request_type"
    t.string "status"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["loan_id"], name: "index_approval_requests_on_loan_id"
    t.index ["user_id"], name: "index_approval_requests_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "author"
    t.boolean "available"
    t.integer "copies"
    t.datetime "created_at", null: false
    t.string "genre"
    t.string "isbn"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "loan_logs", force: :cascade do |t|
    t.string "action"
    t.datetime "created_at", null: false
    t.integer "loan_id", null: false
    t.integer "performed_by_id", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_id"], name: "index_loan_logs_on_loan_id"
    t.index ["performed_by_id"], name: "index_loan_logs_on_performed_by_id"
  end

  create_table "loans", force: :cascade do |t|
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.date "due_date"
    t.date "loan_date"
    t.date "return_date"
    t.string "status"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["book_id"], name: "index_loans_on_book_id"
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.string "role"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "approval_requests", "loans"
  add_foreign_key "approval_requests", "users"
  add_foreign_key "loan_logs", "loans"
  add_foreign_key "loan_logs", "users", column: "performed_by_id"
  add_foreign_key "loans", "books"
  add_foreign_key "loans", "users"
end
