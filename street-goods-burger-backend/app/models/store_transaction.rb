class StoreTransaction < ApplicationRecord
  belongs_to :store_customer
  has_one :cart

  validates :status,
            presence: true,
            inclusion: {
              in: %w[pending processing canceled],
              message: 'Invalid status value'
            }
end
