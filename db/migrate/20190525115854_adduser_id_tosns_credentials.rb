class AdduserIdTosnsCredentials < ActiveRecord::Migration[5.2]
  def change
    add_column :sns_credentials, :user_id, :integer
  end
end
