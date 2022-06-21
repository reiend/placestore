# frozen_string_literal: true

# PersonalDiscountValidations module
module PersonalDiscountValidations
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    belongs_to :store_customer

    validates :valid_date, presence: true
    validates :discount, presence: true, numericality: { greater_than: -0.99 }
    validates :food_name, presence: true, length: { minimum: 1, maximum: 64 }
    validates :food_category, presence: true, length: { minimum: 1, maximum: 64 }
  end
end
