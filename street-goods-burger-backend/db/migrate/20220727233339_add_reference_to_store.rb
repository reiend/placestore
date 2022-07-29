class AddReferenceToStore < ActiveRecord::Migration[7.0]
  def change
    add_reference :stores, :store_admin, null: false, foreign_key: true
  end
end
