class Review < ApplicationRecord
  belongs_to :food
  belongs_to :store_customer

  validates :reviewer, length: { minimum: 1, maximum: 64 }, uniqueness: true
  validates :text_body, length: { minimum: 1, maximum: 256 }
end
