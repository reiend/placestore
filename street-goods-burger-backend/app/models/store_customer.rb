# frozen_string_literal: true

# StoreCustomer Template
class StoreCustomer < ApplicationRecord
  include StoreCustomerValidations
  include StoreCustomerFeatures
end
