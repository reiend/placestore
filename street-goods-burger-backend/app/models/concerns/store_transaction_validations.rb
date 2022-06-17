# frozen_string_literal: true

# StoreTransactionValidations module
module StoreTransactionValidations
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    belongs_to :store_customer
    has_one :cart

    validates :status,
              presence: true,
              inclusion: {
                in: %w[pending processing canceled],
                message: 'Invalid status value'
              }
  end
end
