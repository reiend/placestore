# frozen_string_literal: true

# StoreCustomer::InfoController Template
class StoreCustomer::InfoController < StoreCustomer::StoreCustomerController
  def index
    store_transaction = current_store_customer.store_transactions.last

    current_store_transaction = if store_transaction[:status] == 'pending'
                                  store_transaction
                                else
                                  'no current store transaction'
                                end

    render json: {
      status: 200,
      message: 'successfully fetch current store customer information',
      data: {
        current_store_transaction:,
        store_customer: current_store_customer
      }
    }
  end
end
