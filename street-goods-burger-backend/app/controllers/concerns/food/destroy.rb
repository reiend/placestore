# frozen_string_literal: true

module Food::Destroy
  # for creating new food for the store
  # this includes uploading images after creating on cloudinary

  def destroy
    food_id = remove_food_params[:food_id]
    remove_food_info = current_store_admin.remove_food(food_id:)

    render json: remove_food_info
  rescue ActionController::ParameterMissing => e
    render json: {
      status: 400,
      message: 'invalid parameters',
      errors: e.message
    }
  end

  private

  def remove_food_params
    params
      .require(:food_info)
      .permit(
        :food_id
      )
  end
end