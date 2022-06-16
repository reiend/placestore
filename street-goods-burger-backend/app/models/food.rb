class Food < ApplicationRecord
  belongs_to :store
  has_many :reviews

  validates :name, length: { minimum: 1, maximum: 64 }, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0.00 }
  validates :category, presence: true, length: { minimum: 1, maximum: 64 }, uniqueness: true
  validates :description, length: { minimum: 1, maximum: 128 }
  validates :like, numericality: { only_integer: true, greater_than: -1 }
  validates :is_available, inclusion: { in: [true, false] }
  validates :discount, presence: true, numericality: { greater_than: 0.00 }

end
