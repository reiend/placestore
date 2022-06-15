class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :quantity, null: false, default: 1
      t.decimal :total_price, null: false, default: 0.00

      t.timestamps
    end
  end
end
