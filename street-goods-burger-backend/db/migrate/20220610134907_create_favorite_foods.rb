class CreateFavoriteFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_foods do |t|

      t.timestamps
    end
  end
end
