# frozen_string_literal: true

# FoodValidations module

module FoodValidations
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    belongs_to :store
    has_many :reviews

    validates :name, length: { minimum: 1, maximum: 64 }, uniqueness: true
    validates :price, presence: true, numericality: { greater_than: -0.99 }
    validates :category, presence: true, length: { minimum: 1, maximum: 64 }
    validates :description, length: { maximum: 128 }
    validates :like, numericality: { only_integer: true, greater_than: -1 }
    validates :is_available, inclusion: { in: [true, false] }
    validates :discount, presence: true, numericality: { greater_than: -0.99 }
  end
end
