# frozen_string_literal: true

# FoodOrder template
class FoodOrder < ApplicationRecord
  belongs_to :cart

  validates :food_name, length: { minimum: 1, maximum: 64 }
  validates :food_category, presence: true, length: { minimum: 1, maximum: 64 }
  validates :price, presence: true, numericality: { greater_than: -0.99 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
