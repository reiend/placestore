# frozen_string_literal: true

module V1
  # StoreCustomer::CreateStoreTransaction Template
  class StoreCustomer::CreateStoreTransactionController < StoreCustomer::StoreCustomerController
    def create
      create_store_transaction_info = current_store_customer
                                      .create_store_transaction
      render json: create_store_transaction_info
    end
  end
end
