# frozen_string_literal: true

module V1
  # StoreCustomer::CreateStoreTransaction Template
  class StoreCustomer::DeliverAddressController < StoreCustomer::StoreCustomerController
    def update
      deliver_address_info = current_store_customer
                             .update_deliver_address(deliver_address_params: delivery_address_params)
      render json: deliver_address_info
    rescue ActionController::ParameterMissing => e
      render json: {
        status: 400,
        message: 'invalid params',
        errors: e.message
      }
    end

    private

    def delivery_address_params
      params
        .require(:data)
        .permit(:deliver_address)
    end
  end
end
