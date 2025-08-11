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

ActiveRecord::Schema[8.0].define(version: 2025_08_11_161250) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "dropoff_snapshots", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address_line"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.decimal "lat"
    t.decimal "lng"
    t.string "place_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.bigint "shipment_id", null: false
    t.text "qrcode_payload"
    t.string "pdf_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_labels_on_shipment_id"
  end

  create_table "pickup_snapshots", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address_line"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.decimal "lat"
    t.decimal "lng"
    t.string "place_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.string "tracking_code", null: false
    t.bigint "customer_id", null: false
    t.bigint "driver_id"
    t.bigint "pickup_snapshot_id", null: false
    t.bigint "dropoff_snapshot_id", null: false
    t.integer "service_type", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.integer "price_cents", default: 0, null: false
    t.integer "driver_earnings_cents", default: 0, null: false
    t.integer "platform_fee_cents", default: 0, null: false
    t.datetime "scheduled_pickup_start"
    t.datetime "scheduled_pickup_end"
    t.datetime "delivered_at"
    t.decimal "delivered_lat", precision: 10, scale: 7
    t.decimal "delivered_lng", precision: 10, scale: 7
    t.boolean "delivered_out_of_radius", default: false, null: false
    t.string "delivery_photo_url"
    t.string "delivery_signature_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "status"], name: "index_shipments_on_customer_id_and_status"
    t.index ["customer_id"], name: "index_shipments_on_customer_id"
    t.index ["driver_id", "status"], name: "index_shipments_on_driver_id_and_status"
    t.index ["driver_id"], name: "index_shipments_on_driver_id"
    t.index ["dropoff_snapshot_id"], name: "index_shipments_on_dropoff_snapshot_id"
    t.index ["pickup_snapshot_id"], name: "index_shipments_on_pickup_snapshot_id"
    t.index ["tracking_code"], name: "index_shipments_on_tracking_code", unique: true
    t.check_constraint "price_cents >= 0 AND driver_earnings_cents >= 0 AND platform_fee_cents >= 0", name: "chk_shipments_money_nonneg"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "labels", "shipments"
  add_foreign_key "shipments", "dropoff_snapshots"
  add_foreign_key "shipments", "pickup_snapshots"
  add_foreign_key "shipments", "users", column: "customer_id"
  add_foreign_key "shipments", "users", column: "driver_id"
end
