# frozen_string_literal: true

module Food::List
  # for viewing foods on store
  def food_list
    # get store foods according to store_id
    store_foods = Store.find(food_params[:store_id]).foods

    render json: {
      status: 200,
      message: 'viewing foods',
      data: {
        quantity: store_foods.length,
        store_foods:
      }
    }
  rescue ActiveRecord::RecordNotFound
    render json: {
      status: 400,
      message: 'please enter valid params'
    }
  end

  private

  def food_params
    params
      .require(:food)
      .permit(:store_id)
  end
end
