# frozen_string_literal: true

module V1
  # StoreAdmin::ViewStoreCustomerFoodOrdersController Template
  class StoreAdmin::ViewStoreCustomerFoodOrdersController < StoreAdmin::StoreAdminController
    def index
      store_customer_id = view_store_customer_food_orders_params[:store_customer_id]
      view_store_customer_food_orders_info = current_store_admin
                                             .view_store_customer_food_orders(store_customer_id:)
      render json: view_store_customer_food_orders_info
    rescue ActionController::ParameterMissing => e
      render json: {
        status: 400,
        message: 'invalid parameters',
        errors: e.message
      }
    end

    private

    def view_store_customer_food_orders_params
      params
        .require(:data)
        .permit(:store_customer_id)
    end
  end
end
