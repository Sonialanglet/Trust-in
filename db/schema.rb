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

ActiveRecord::Schema.define(version: 20181211151733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["booking_id"], name: "index_answers_on_booking_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.text "description"
    t.date "date"
    t.string "location"
    t.string "status"
    t.bigint "prestation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prestation_id"], name: "index_bookings_on_prestation_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_participants"
    t.string "teaser"
    t.bigint "user_id"
    t.text "resume"
    t.integer "price_cents", default: 0, null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "group_prestations", force: :cascade do |t|
    t.bigint "prestation_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_prestations_on_group_id"
    t.index ["prestation_id"], name: "index_group_prestations_on_prestation_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "title"
    t.bigint "founder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["founder_id"], name: "index_groups_on_founder_id"
  end

  create_table "participations", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 0, null: false
    t.string "event_ref"
    t.jsonb "payment"
    t.integer "amount_cents", default: 0, null: false
    t.integer "available_places"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "prestations", force: :cascade do |t|
    t.string "price"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.string "title"
    t.index ["category_id"], name: "index_prestations_on_category_id"
    t.index ["user_id"], name: "index_prestations_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.text "description"
    t.string "town"
    t.string "adress"
    t.string "school1"
    t.string "school2"
    t.string "formation1"
    t.string "formation2"
    t.bigint "user_id"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.float "latitude"
    t.float "longitude"
    t.string "street_number"
    t.string "route"
    t.string "locality"
    t.string "country"
    t.bigint "school_child_id"
    t.index ["school_child_id"], name: "index_profiles_on_school_child_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "recomands", force: :cascade do |t|
    t.bigint "prestation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prestation_id"], name: "index_recomands_on_prestation_id"
    t.index ["user_id"], name: "index_recomands_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "content"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["post_id"], name: "index_replies_on_post_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "prestation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prestation_id"], name: "index_reviews_on_prestation_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "school_children", force: :cascade do |t|
    t.string "name"
    t.string "adress"
    t.string "CP"
    t.string "locality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["name"], name: "index_school_children_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "first_name"
    t.string "last_name"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "token"
    t.datetime "token_expiry"
    t.boolean "admin", default: false
    t.boolean "newsletter", default: true
    t.boolean "agreement", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "bookings"
  add_foreign_key "answers", "users"
  add_foreign_key "bookings", "prestations"
  add_foreign_key "bookings", "users"
  add_foreign_key "events", "users"
  add_foreign_key "group_prestations", "groups"
  add_foreign_key "group_prestations", "prestations"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "groups", "users", column: "founder_id"
  add_foreign_key "participations", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "prestations", "categories"
  add_foreign_key "prestations", "users"
  add_foreign_key "profiles", "school_children"
  add_foreign_key "profiles", "users"
  add_foreign_key "recomands", "prestations"
  add_foreign_key "recomands", "users"
  add_foreign_key "replies", "posts"
  add_foreign_key "replies", "users"
  add_foreign_key "reviews", "prestations"
  add_foreign_key "reviews", "users"
end
