class CreateNames < ActiveRecord::Migration[5.2]
  def change
    create_table :names do |t|
      t.string :family_name
      t.string :family_name_kana
      t.string :first_name
      t.string :first_name_kana
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
