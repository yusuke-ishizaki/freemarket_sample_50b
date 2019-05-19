class AddBlandToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :bland, :integer
  end
end
