class AddBlandIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :bland_id, :integer
  end
end
