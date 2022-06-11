class StoreTransaction < ApplicationRecord
  belongs_to :store_customer
  has_one :cart
end
