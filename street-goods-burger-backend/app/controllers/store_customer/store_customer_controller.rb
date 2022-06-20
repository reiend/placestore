# frozen_string_literal: true

# StoreCustomerController  Template
class StoreCustomer::StoreCustomerController < ApplicationController
  before_action :authenticate_store_customer!
end
