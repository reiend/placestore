class FoodOrder < ApplicationRecord
  belongs_to :cart

  validates :food_name, length: { minimum: 1, maximum: 64 }, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0.00 }
  validates :food_category, presence: true, length: { minimum: 1, maximum: 64 }, uniqueness: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

end
