class Store < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      ## Database authenticatable
      t.string :store_name, null: false, default: ''
      t.string :address, null: false, default: ''

      t.timestamps null: false
    end
  end
end
