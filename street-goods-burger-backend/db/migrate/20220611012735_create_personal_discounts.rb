class CreatePersonalDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_discounts do |t|
      t.datetime :valid_date, null: false, default: DateTime.now + 24.hour
      t.bigint :discount, null: false, default: 5.00
      t.string :food_name, null: false, default: ''
      t.string :food_category, null: false, default: ''

      t.timestamps
    end
  end
end
