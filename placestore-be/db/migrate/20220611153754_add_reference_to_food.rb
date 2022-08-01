class AddReferenceToFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :store, null: false, foreign_key: true
  end
end
