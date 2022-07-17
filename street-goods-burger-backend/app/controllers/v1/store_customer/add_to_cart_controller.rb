# frozen_string_literal: true

module V1
  # AddToCartController Template
  class StoreCustomer::AddToCartController < StoreCustomer::StoreCustomerController
    def create
      ordered_food = add_to_cart_params[:ordered_food]

      # render json: ordered_food
      add_to_cart_info = current_store_customer.add_to_cart(
        ordered_food:
      )

      render json: add_to_cart_info
    rescue ActionController::ParameterMissing => e
      render json: {
        status: 400,
        message: 'invalid parameters',
        errors: e.message
      }
    end

    private

    def add_to_cart_params
      params
        .require(:add_to_cart_info)
        .permit(
          { ordered_food: %i[food_name food_category price quantity] }
        )
    end
  end
end
