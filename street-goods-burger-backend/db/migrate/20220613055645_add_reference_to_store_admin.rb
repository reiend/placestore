class AddReferenceToStoreAdmin < ActiveRecord::Migration[7.0]
  def change
    # add_reference :store_admins, :store, null: false, foreign_key: true
  end
end
