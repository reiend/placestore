class FavoriteFood < ApplicationRecord
  belongs_to :store_customer

  validates :like,  numericality: { only_integer: true, greater_than: -1 }
  validates :price, presence: true, numericality: { greater_than: 0.00 }
  validates :name, presence: true, length: { minimum: 1, maximum: 64 }, uniqueness: true
  validates :category, presence: true, length: { minimum: 1, maximum: 64 }, uniqueness: true
  validates :description, length: { minimum: 1, maximum: 128 }
end
