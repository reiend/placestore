# frozen_string_literal: true

# StoreAdmin::UpdateFoodController Template
class StoreAdmin::UpdateFoodController < StoreAdmin::StoreAdminController
  def update
    food_id = update_food_params[:food_id]
    food_info = update_food_params[:new_food_info]

    name = food_info[:name]
    category = food_info[:category]
    description = food_info[:description]
    price = food_info[:price]

    update_food_info = current_store_admin
                       .update_food(
                         food_id:,
                         food_info: {
                           name:,
                           category:,
                           description:,
                           price:
                         }
                       )

    render json: update_food_info
  rescue ActionController::ParameterMissing => e
    render json: {
      status: 400,
      message: 'invalid parameters',
      errors: e.message
    }
  end

  private

  def update_food_params
    params
      .require(:food_info)
      .permit(
        :food_id,
        { new_food_info: %i[name category description price] }
      )
  end
end
