# frozen_string_literal: true

# StoreCustomer::InfoController Template
class StoreCustomer::InfoController < StoreCustomer::StoreCustomerController
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
