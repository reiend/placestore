# frozen_string_literal: true

module V1
  # StoreCustomer::ViewFavoriteFoodController Template
  class StoreCustomer::ViewFavoriteFoodsController < StoreCustomer::StoreCustomerController
    def index
      view_favorite_food_info = current_store_customer.view_favorite_foods
      render json: view_favorite_food_info
    end
  end
end
