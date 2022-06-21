# frozen_string_literal: true

# StoreAdmin::AddNewFoodController Template
class StoreAdmin::AddNewFoodController < StoreAdmin::StoreAdminController
  def create
    food_info = add_new_food_params

    add_new_food_info = current_store_admin
                        .add_new_food(food_info:)

    render json: add_new_food_info
  rescue ActionController::ParameterMissing => e
    render json: {
      status: 400,
      message: 'invalid parameters',
      errors: e.message
    }
  end

  private

  def add_new_food_params
    params
      .require(:food_info)
      .permit(
        :name,
        :category,
        :description,
        :price
      )
  end
end
