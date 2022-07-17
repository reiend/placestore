# frozen_string_literal: true

module V1
  # StoreCustomer::LikeFoodController Template
  class StoreCustomer::LikeFoodController < StoreCustomer::StoreCustomerController
    def update
      food_id = like_food_params[:food_id]
      like_food_info = current_store_customer.like_food(food_id:)

      render json: like_food_info
    rescue ActionController::ParameterMissing => e
      render json: {
        status: 400,
        message: 'invalid parameters',
        errors: e.message
      }
    end

    private

    def like_food_params
      params
        .require(:food_info)
        .permit(:food_id)
    end
  end
end
