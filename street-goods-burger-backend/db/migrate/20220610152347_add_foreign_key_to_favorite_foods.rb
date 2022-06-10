class AddForeignKeyToFavoriteFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :favorite_foods, :store_customer, null: false, foreign_key: true
  end
end
