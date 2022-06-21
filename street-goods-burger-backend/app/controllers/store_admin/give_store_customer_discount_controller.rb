# frozen_string_literal: true

# StoreAdmin::GiveStoreCustomerDiscountController Template
class StoreAdmin::GiveStoreCustomerDiscountController < StoreAdmin::StoreAdminController
  def create
    personal_discount_info = give_store_customer_discount_params

    give_store_customer_discount_info = current_store_admin
                                        .give_store_customer_discount(personal_discount_info:)

    render json: give_store_customer_discount_info
  end

  private

  def give_store_customer_discount_params
    params
      .require(:personal_discount_info)
      .permit(
        :food_name,
        :food_category,
        :discount,
        :hour,
        :store_customer_id
      )
  end
end
