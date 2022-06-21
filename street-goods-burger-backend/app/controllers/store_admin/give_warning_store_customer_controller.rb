# frozen_string_literal: true

# StoreAdmin::GiveWarningStoreCustomerController Template
class StoreAdmin::GiveWarningStoreCustomerController < StoreAdmin::StoreAdminController
  def update
    store_customer_id = give_warning_store_customer_params[:store_customer_id]
    give_warning_store_customer_info = current_store_admin
                                       .give_warning_store_customer(store_customer_id:)

    render json: give_warning_store_customer_info
  end

  private

  def give_warning_store_customer_params
    params
      .require(:data)
      .permit(
        :store_customer_id
      )
  end
end
