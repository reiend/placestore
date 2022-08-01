class AddReferenceToCart < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :store_transaction, null: false, foreign_key: true
  end
end