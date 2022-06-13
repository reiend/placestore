class AddJtiToStoreAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :store_admins, :jti, :string
    add_index :store_admins, :jti
  end
end
