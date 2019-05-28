class AddSaleToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sale, :string
  end
end
