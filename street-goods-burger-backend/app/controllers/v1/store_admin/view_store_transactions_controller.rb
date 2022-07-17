# frozen_string_literal: true

module V1
  # StoreAdmin::ViewStoreTransactions Template
  class StoreAdmin::ViewStoreTransactionsController < StoreAdmin::StoreAdminController
    def index
      store_id = current_store_admin.store[:id]
      view_store_transactions_info = current_store_admin
                                     .view_store_transactions(store_id:)
      render json: view_store_transactions_info
    end
  end
end
