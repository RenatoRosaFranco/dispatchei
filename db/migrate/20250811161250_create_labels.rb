class CreateLabels < ActiveRecord::Migration[8.0]
  def change
    create_table :labels do |t|
      t.references :shipment, null: false, foreign_key: true
      t.text :qrcode_payload
      t.string :pdf_url

      t.timestamps
    end
  end
end
