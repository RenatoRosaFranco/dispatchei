# frozen_string_literal: true

class CreateShipments < ActiveRecord::Migration[8.0]
  def change
    create_table :shipments do |t|
      t.string :tracking_code, null: false

      t.references :customer, null: false, foreign_key: { to_table: :users }
      t.references :driver,   null: true,  foreign_key: { to_table: :users }

      t.references :pickup_snapshot,  null: false, foreign_key: true
      t.references :dropoff_snapshot, null: false, foreign_key: true

      t.integer :service_type, null: false, default: 0
      t.integer :status,       null: false, default: 0

      t.integer :price_cents,            null: false, default: 0
      t.integer :driver_earnings_cents,  null: false, default: 0
      t.integer :platform_fee_cents,     null: false, default: 0

      t.datetime :scheduled_pickup_start
      t.datetime :scheduled_pickup_end

      t.datetime :delivered_at
      t.decimal  :delivered_lat, precision: 10, scale: 7
      t.decimal  :delivered_lng, precision: 10, scale: 7
      t.boolean  :delivered_out_of_radius, null: false, default: false
      t.string   :delivery_photo_url
      t.string   :delivery_signature_url

      t.timestamps
    end

    add_index :shipments, :tracking_code, unique: true
    add_index :shipments, %i[customer_id status]
    add_index :shipments, %i[driver_id status]
    add_check_constraint :shipments, "price_cents >= 0 AND driver_earnings_cents >= 0 AND platform_fee_cents >= 0", name: "chk_shipments_money_nonneg"
  end
end
