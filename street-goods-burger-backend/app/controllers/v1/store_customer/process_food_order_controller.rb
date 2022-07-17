# frozen_string_literal: true

module V1
  # StoreCustomer::ProcessFoodOrderController Template
  class StoreCustomer::ProcessFoodOrderController < StoreCustomer::StoreCustomerController
    def update
      store_transaction_id = process_food_order_params[:store_transaction_id]

      process_food_order_info = current_store_customer
                                .process_food_order(store_transaction_id:)
      render json: process_food_order_info
    rescue ActionController::ParameterMissing => e
      render json: {
        status: 400,
        message: 'invalid parameters',
        errors: e.message
      }
    end

    private

    def process_food_order_params
      params
        .require(:store_transaction_info)
        .permit(:store_transaction_id)
    end
  end
end
