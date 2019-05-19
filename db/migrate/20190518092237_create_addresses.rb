class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :post_code
      t.string :region
      t.string :city
      t.string :block
      t.string :building
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
