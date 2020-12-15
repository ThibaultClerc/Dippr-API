# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_15_121011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "dishes_ingredients", force: :cascade do |t|
    t.bigint "user_dish_id"
    t.bigint "ingredient_id"
    t.index ["ingredient_id"], name: "index_dishes_ingredients_on_ingredient_id"
    t.index ["user_dish_id"], name: "index_dishes_ingredients_on_user_dish_id"
  end

  create_table "dishes_tags", force: :cascade do |t|
    t.bigint "user_dish_id"
    t.bigint "tag_id"
    t.index ["tag_id"], name: "index_dishes_tags_on_tag_id"
    t.index ["user_dish_id"], name: "index_dishes_tags_on_user_dish_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "market_dishes", force: :cascade do |t|
    t.bigint "user_dish_id"
    t.integer "market_dish_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_dish_id"], name: "index_market_dishes_on_user_dish_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_dish_ingredients", force: :cascade do |t|
    t.bigint "user_dish_id"
    t.bigint "ingredient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_user_dish_ingredients_on_ingredient_id"
    t.index ["user_dish_id"], name: "index_user_dish_ingredients_on_user_dish_id"
  end

  create_table "user_dish_tags", force: :cascade do |t|
    t.bigint "user_dish_id"
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_user_dish_tags_on_tag_id"
    t.index ["user_dish_id"], name: "index_user_dish_tags_on_user_dish_id"
  end

  create_table "user_dishes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "dish_rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_user_dishes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "is_admin", default: false, null: false
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.string "city", default: ""
    t.text "street", default: ""
    t.string "country", default: ""
    t.string "zip_code", default: ""
    t.text "description", default: ""
    t.integer "dippers", default: 3
    t.integer "user_rating"
    t.string "phone_number", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "dishes_ingredients", "ingredients"
  add_foreign_key "dishes_ingredients", "user_dishes"
  add_foreign_key "dishes_tags", "tags"
  add_foreign_key "dishes_tags", "user_dishes"
  add_foreign_key "market_dishes", "user_dishes"
  add_foreign_key "user_dish_ingredients", "ingredients"
  add_foreign_key "user_dish_ingredients", "user_dishes"
  add_foreign_key "user_dish_tags", "tags"
  add_foreign_key "user_dish_tags", "user_dishes"
  add_foreign_key "user_dishes", "users"
end
