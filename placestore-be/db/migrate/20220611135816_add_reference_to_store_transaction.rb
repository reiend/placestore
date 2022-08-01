class AddReferenceToStoreTransaction < ActiveRecord::Migration[7.0]
  def change
    add_reference :store_transactions, :store_customer, null: false, foreign_key: true
    add_reference :store_transactions, :store, null: false, foreign_key: true
  end
end
