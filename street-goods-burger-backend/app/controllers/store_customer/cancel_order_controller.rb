# frozen_string_literal: true

# CancelOrderController Template
class StoreCustomer::CancelOrderController < StoreCustomer::StoreCustomerController
  def update
    store_transaction_id = cancel_order_params[:store_transaction_id]
    cancel_order_info = current_store_customer.cancel_order(store_transaction_id:)
    render json: cancel_order_info
  rescue ActionController::ParameterMissing => e
    render json: {
      status: 400,
      message: 'invalid parameters',
      errors: e.message
    }
  end

  private

  def cancel_order_params
    params
      .require(:cancel_order_info)
      .permit(
        :store_transaction_id
      )
  end
end
