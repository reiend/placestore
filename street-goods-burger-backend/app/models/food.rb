class Food < ApplicationRecord
  belongs_to :store
  has_many :reviews
end
