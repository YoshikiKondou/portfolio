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

ActiveRecord::Schema[7.0].define(version: 2022_09_16_140056) do
  create_table "diets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "body_weight"
    t.float "protein"
    t.float "fat"
    t.float "carbohydrate"
    t.datetime "record_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "memo"
    t.text "Diet_memo"
    t.text "calorie_memo"
    t.index ["user_id"], name: "index_diets_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email"
    t.string "password_digest"
    t.string "image"
    t.text "introduction"
    t.float "target_protein"
    t.float "target_fat"
    t.float "target_carbohydrate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workout_menus", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.string "menu"
    t.float "first_set_weight"
    t.float "second_set_weight"
    t.float "third_set_weight"
    t.float "fourth_set_weight"
    t.float "fifth_set_weight"
    t.integer "first_set_rep"
    t.integer "second_set_rep"
    t.integer "third_set_rep"
    t.integer "fourth_set_rep"
    t.integer "fifth_set_rep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_id"], name: "index_workout_menus_on_workout_id"
  end

  create_table "workouts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "part"
    t.text "memo"
    t.integer "sleep"
    t.integer "eat"
    t.integer "motivation"
    t.integer "fatigue"
    t.integer "muscle"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "diets", "users"
  add_foreign_key "workout_menus", "workouts"
end
