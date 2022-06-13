class Store < ApplicationRecord
  has_many :store_customers
  has_many :store_admins
  has_many :foods
end
