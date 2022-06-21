# frozen_string_literal: true

# StoreCustomer::MarkFavoriteFoodController Template
class StoreCustomer::MarkFavoriteFoodController < StoreCustomer::StoreCustomerController
  def create
    food_info_params = mark_favorite_food_params[:food_info]

    favorite_food_info = current_store_customer
                         .mark_favorite_food(
                           store_customer_id: current_store_customer[:id],
                           food_info: food_info_params
                         )
    render json: favorite_food_info
  rescue ActionController::ParameterMissing => e
    render json: {
      status: 400,
      message: 'invalid parameters',
      errors: e.message
    }
  end

  private

  def mark_favorite_food_params
    params
      .require(:mark_favorite_food_info)
      .permit(
        { food_info: %i[name category like price description] }
      )
  end
end
