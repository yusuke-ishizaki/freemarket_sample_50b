class RemoveBlandFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :bland, :integer
  end
end
