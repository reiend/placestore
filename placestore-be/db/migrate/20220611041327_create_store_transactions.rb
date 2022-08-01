class CreateStoreTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :store_transactions do |t|
      t.string :status, null: false, default: 'pending'

      t.timestamps
    end
  end
end
