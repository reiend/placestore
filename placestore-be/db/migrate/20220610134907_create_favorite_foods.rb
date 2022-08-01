class CreateFavoriteFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_foods do |t|
      t.string :name, null: false, default: ''
      t.decimal :price, null: false, default: 0.00
      t.string :category, null: false, default: ''
      t.string :description, null: false, default: ''
      t.integer :like, null: false, default: 0
      t.boolean :is_available, null: false, default: true

      t.timestamps
    end
  end
end
