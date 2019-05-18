class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :price
      t.string :region
      t.string :date
      t.string :method
      t.references :product_id, foreign_key: true

      t.timestamps
    end
  end
end
