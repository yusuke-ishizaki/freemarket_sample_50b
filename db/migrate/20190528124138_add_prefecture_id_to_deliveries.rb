class AddPrefectureIdToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :prefecture_id, :integer
  end
end
