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

ActiveRecord::Schema.define(version: 2022_02_19_225812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "workTime"
    t.integer "studyTime"
    t.integer "diffculty"
    t.integer "timeWish"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "course_code"
    t.string "course_title"
    t.string "professor_name"
    t.string "university_name"
    t.string "users_id"
    t.text "thought"
    t.index ["users_id"], name: "index_reviews_on_users_id"
  end

  create_table "users", primary_key: "username", id: :string, force: :cascade do |t|
    t.string "password_hash"
    t.string "type_of_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "reviews_id"
    t.index ["reviews_id"], name: "index_users_on_reviews_id"
  end

  add_foreign_key "comments", "reviews"
  add_foreign_key "users", "reviews", column: "reviews_id"
end
