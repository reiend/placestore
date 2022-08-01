# frozen_string_literal: true

# FavoriteFood Template
class FavoriteFood < ApplicationRecord
  belongs_to :store_customer

  validates :name, presence: true, length: { minimum: 1, maximum: 64 }, uniqueness: true
  validates :category, presence: true, length: { minimum: 1, maximum: 64 }
  validates :like,  numericality: { only_integer: true, greater_than: -1 }
  validates :price, presence: true, numericality: { greater_than: 0.00 }
  validates :description, length: { maximum: 128 }
end
