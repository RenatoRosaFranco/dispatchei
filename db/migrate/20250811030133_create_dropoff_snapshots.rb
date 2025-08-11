# frozen_string_literal: true

class CreateDropoffSnapshots < ActiveRecord::Migration[8.0]
  def change
    create_table :dropoff_snapshots do |t|
      t.string :name
      t.string :phone
      t.string :address_line
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.decimal :lat
      t.decimal :lng
      t.string :place_id
      t.text :notes

      t.timestamps
    end
  end
end
