class AddJtiToStoreCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :store_customers, :jti, :string
    add_index :store_customers, :jti
  end
end
