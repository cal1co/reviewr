
ActiveRecord::Schema.define(version: 2022_01_29_094949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lists", force: :cascade do |t|
    t.text "title"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
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
  end

  create_table "users_lists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "list_id"
  end

end
