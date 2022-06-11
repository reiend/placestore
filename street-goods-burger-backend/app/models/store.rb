class Store < ApplicationRecord
  has_many :store_customers
  has_many :foods
end
