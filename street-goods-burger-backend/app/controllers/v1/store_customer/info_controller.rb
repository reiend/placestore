# frozen_string_literal: true

module V1
  # StoreCustomer::InfoController Template
  class StoreCustomer::InfoController < StoreCustomer::StoreCustomerController
    def index
      store_transaction = current_store_customer.store_transactions.last

      if store_transaction.present?
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
        return
      end
      render json: {
        status: 200,
        message: 'successfully fetch current store customer information',
        data: {
          current_store_transaction: 'no current store transaction',
          store_customer: current_store_customer
        }
      }
    rescue NoMethodError => e
      render json: {
        status: 400,
        message: 'please provide needed data',
        error: e.message
      }
    end
  end
end
