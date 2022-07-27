# frozen_string_literal: true

# Review Template
class Review < ApplicationRecord
  belongs_to :food
  belongs_to :store_customer

  validates :text_body, length: { minimum: 1, maximum: 256 }
end
