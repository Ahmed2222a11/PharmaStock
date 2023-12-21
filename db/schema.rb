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

ActiveRecord::Schema[7.1].define(version: 2023_12_21_102559) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_medicaments", force: :cascade do |t|
    t.integer "quantite"
    t.bigint "booking_id", null: false
    t.bigint "medicament_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_medicaments_on_booking_id"
    t.index ["medicament_id"], name: "index_booking_medicaments_on_medicament_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pharmacie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pharmacie_id"], name: "index_bookings_on_pharmacie_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "medicaments", force: :cascade do |t|
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "medoc_veto", default: false
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "adresse"
    t.string "nom"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "horaires"
    t.boolean "de_garde"
    t.boolean "veto", default: false
    t.boolean "veto_garde", default: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "quantite"
    t.bigint "medicament_id", null: false
    t.bigint "pharmacie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicament_id"], name: "index_stocks_on_medicament_id"
    t.index ["pharmacie_id"], name: "index_stocks_on_pharmacie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nom"
    t.string "adresse"
    t.string "telephone"
    t.string "first_name"
    t.string "last_name"
    t.string "nir"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "booking_medicaments", "bookings"
  add_foreign_key "booking_medicaments", "medicaments"
  add_foreign_key "bookings", "pharmacies", column: "pharmacie_id"
  add_foreign_key "bookings", "users"
  add_foreign_key "stocks", "medicaments"
  add_foreign_key "stocks", "pharmacies", column: "pharmacie_id"
end
