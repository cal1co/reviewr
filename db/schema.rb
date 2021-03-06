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

ActiveRecord::Schema.define(version: 2022_02_05_063918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "reply"
    t.integer "review_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "review_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_likes_on_review_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.text "title"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "list"
  end

  create_table "lists_reviews", force: :cascade do |t|
    t.integer "review_id"
    t.integer "list_id"
  end

  create_table "lists_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "list_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "image"
    t.string "strength"
    t.string "weakness"
    t.text "rating"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "like_count", default: 0
    t.string "like_status"
  end

  create_table "reviews_lists", force: :cascade do |t|
    t.integer "review_id"
    t.integer "list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text "image"
    t.string "email"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes"
    t.text "bio"
    t.date "birthday"
    t.boolean "setimage", default: false
  end

  create_table "users_lists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "list_id"
  end

  add_foreign_key "likes", "reviews"
  add_foreign_key "likes", "users"
end
