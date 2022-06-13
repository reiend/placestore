class PersonalDiscount < ApplicationRecord
  belongs_to :store_customer

  validates :valid_date, presence: true
  validates :discount, presence: true, numericality: { greater_than: 0.00 }
  validates :food_name, presence: true, length: { minimum: 1, maximum: 64 }
  validates :food_category, presence: true, length: { minimum: 1, maximum: 64 }
end
