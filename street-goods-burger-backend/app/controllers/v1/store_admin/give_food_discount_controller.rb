# frozen_string_literal: true

module V1
  # StoreAdmin::GiveFoodDiscountController Template
  class StoreAdmin::GiveFoodDiscountController < StoreAdmin::StoreAdminController
    def update
      food_id = give_food_discount_params[:food_id]
      food_discount_percent = give_food_discount_params[:food_discount_percent]

      give_food_discount_info = current_store_admin
                                .give_food_discount(
                                  food_id:,
                                  food_discount_percent:
                                )

      render json: give_food_discount_info
    rescue ActionController::ParameterMissing => e
      render json: {
        status: 400,
        message: 'invalid parameters',
        errors: e.message
      }
    end

    private

    def give_food_discount_params
      params
        .require(:data)
        .permit(
          :food_id,
          :food_discount_percent
        )
    end
  end
end
