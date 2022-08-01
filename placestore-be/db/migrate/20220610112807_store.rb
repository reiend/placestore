class Store < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      ## Database authenticatable
      t.string :name, null: false, default: ''
      t.string :line1, null: false, default: ''
      t.string :line2, null: false, default: ''
      t.string :postal_code, null: false, default: ''
      t.string :city, null: false, default: ''
      t.string :province, null: false, default: ''

      t.timestamps null: false
    end
  end
end
