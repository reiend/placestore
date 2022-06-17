# frozen_string_literal: true

# ReviewValidations module
module ReviewValidations
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    belongs_to :food
    belongs_to :store_customer

    validates :text_body, length: { minimum: 1, maximum: 256 }
  end
end
