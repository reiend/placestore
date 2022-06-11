class AddReferenceToPersonalDiscount < ActiveRecord::Migration[7.0]
  def change
    add_reference :personal_discounts, :store_customer, null: false, foreign_key: true
  end
end
