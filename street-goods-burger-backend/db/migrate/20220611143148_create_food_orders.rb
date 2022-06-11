class CreateFoodOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :food_orders do |t|
      t.string :food_name, null: false, default: ''
      t.string :food_category, null: false, default: ''
      t.integer :quantity, null: false, default: 1
      t.bigint :price, null: false, default: 0.00

      t.timestamps
    end
  end
end
