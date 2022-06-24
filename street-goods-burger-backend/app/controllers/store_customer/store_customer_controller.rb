# frozen_string_literal: true

# StoreCustomerController  Template
class StoreCustomer::StoreCustomerController < ApplicationController
  before_action :authenticate_store_customer!

  def current_store_transaction
    render json: {
      status: 200,
      message: 'successfully fetch current store transaction',
      data: {
        store_transaction: current_store_customer.store_transaction.last
      }
    }
  end
end
