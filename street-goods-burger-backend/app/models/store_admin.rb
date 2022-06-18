# frozen_string_literal: true

# StoreAdmin template
class StoreAdmin < ApplicationRecord
  include StoreAdminValidations
  include StoreAdminFeatures
end
