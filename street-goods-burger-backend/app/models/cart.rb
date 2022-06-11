class Cart < ApplicationRecord
  belongs_to :store_transaction
  has_many :food_orders
end
