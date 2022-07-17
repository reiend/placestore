# frozen_string_literal: true

module V1
  # StoreAdmin::ProcessFoodController Template
  class StoreAdmin::DeliverOrderController < StoreAdmin::StoreAdminController
    def update
      store_customer_id = deliver_order_params[:store_customer_id]
      store_transaction_id = deliver_order_params[:store_transaction_id]

      deliver_order_info = current_store_admin.mark_deliver(store_customer_id:, store_transaction_id:)

      render json: deliver_order_info
    rescue ActionController::ParameterMissing => e
      render json: {
        status: 400,
        message: 'invalid parameters',
        errors: e.message
      }
    end

    private

    def deliver_order_params
      params
        .require(:data)
        .permit(
          :store_customer_id,
          :store_transaction_id
        )
    end
  end
end
