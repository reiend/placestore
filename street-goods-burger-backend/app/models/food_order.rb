# frozen_string_literal: true

# FoodOrder template
class FoodOrder < ApplicationRecord
  include FoodOrderValidations
end
