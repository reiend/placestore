# frozen_string_literal: true

module V1
  # StoreAdmin::ProcessFoodController Template
  class StoreAdmin::ProcessOrderController < StoreAdmin::StoreAdminController
    def update
      store_customer_id = process_order_params[:store_customer_id]
      store_transaction_id = process_order_params[:store_transaction_id]

      process_order_info = current_store_admin.process_order(store_customer_id:, store_transaction_id:)

      render json: process_order_info
    rescue ActionController::ParameterMissing => e
      render json: {
        status: 400,
        message: 'invalid parameters',
        errors: e.message
      }
    end

    private

    def process_order_params
      params
        .require(:data)
        .permit(
          :store_customer_id,
          :store_transaction_id
        )
    end
  end
end
