class AddReferenceToFoodOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :food_orders, :cart, null: false, foreign_key: true
  end
end
