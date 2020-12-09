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

ActiveRecord::Schema.define(version: 2020_12_09_103909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  add_foreign_key "dishes_ingredients", "ingredients"
  add_foreign_key "dishes_ingredients", "user_dishes"
  add_foreign_key "dishes_tags", "tags"
  add_foreign_key "dishes_tags", "user_dishes"
  add_foreign_key "user_dish_ingredients", "ingredients"
  add_foreign_key "user_dish_ingredients", "user_dishes"
  add_foreign_key "user_dish_tags", "tags"
  add_foreign_key "user_dish_tags", "user_dishes"
end
