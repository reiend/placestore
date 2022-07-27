# frozen_string_literal: true

# StoreTransaction Template
class StoreTransaction < ApplicationRecord
  belongs_to :store_customer
  has_one :cart

  validates :status,
            presence: true,
            inclusion: {
              in: %w[pending pre_process processing delivered canceled],
              message: 'Invalid status value'
            }
end
