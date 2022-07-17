# frozen_string_literal: true

module V1
  # StoreAdmin::ViewRegisteredStoreCustomerController Template
  class StoreAdmin::ViewRegisteredStoreCustomersController < StoreAdmin::StoreAdminController
    def index
      store_id = current_store_admin[:id]
      view_registered_store_customer_info = current_store_admin
                                            .view_registered_store_customers(store_id:)
      render json: view_registered_store_customer_info
    end
  end
end
