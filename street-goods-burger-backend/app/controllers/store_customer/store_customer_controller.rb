# frozen_string_literal: true

# StoreCustomer::StoreCustomerController Template
class StoreCustomer::StoreCustomerController < ApplicationController
  before_action :authenticate_store_customer!

  def index
    render json: {
      status: 200,
      message: 'successfully fetch current store customer information',
      data: {
        store_customer: current_store_customer
      }
    }
  end
end
