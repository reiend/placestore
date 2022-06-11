class CreatePersonalDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_discounts do |t|

      t.timestamps
    end
  end
end
