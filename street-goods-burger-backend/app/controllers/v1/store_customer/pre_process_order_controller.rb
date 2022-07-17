# frozen_string_literal: true

module V1
  # StoreCustomer::PreProcessOrderContoller Template
  class StoreCustomer::PreProcessOrderController < StoreCustomer::StoreCustomerController
    def index
      pre_process_order_info = current_store_customer.pre_process_order
      render json: pre_process_order_info
    end
  end
end
