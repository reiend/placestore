class Review < ApplicationRecord
  belongs_to :food

  validates :reviewer, length: { minimum: 1, maximum: 64 }, uniqueness: true
  validates :comment, length: { minimum: 1, maximum: 256 }
end
