# frozen_string_literal: true

# AddToCartController Template
class StoreCustomer::AddToCartController < StoreCustomer::StoreCustomerController
  def create
    ordered_food = add_to_cart_params[:ordered_food]

    add_to_cart_info = current_store_customer.add_to_cart(
      ordered_food:
    )

    render json: add_to_cart_info
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
