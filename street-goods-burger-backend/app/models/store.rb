# frozen_string_literal: true

# Store Template
class Store < ApplicationRecord
  belongs_to :store_admin
  has_many :store_customers
  has_many :foods

  validates :name,
            :line1,
            :line2,
            :postal_code,
            :city,
            :province,
            presence: true

  validates :name,
            :line1,
            :line2,
            uniqueness: true

  validates :name,
            :line1,
            :line2,
            :postal_code,
            :city,
            :province,
            length: { minimum: 1, maximum: 128 }
end
