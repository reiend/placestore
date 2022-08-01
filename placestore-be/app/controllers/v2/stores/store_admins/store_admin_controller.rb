module V2
  module Stores
    module StoreAdmins
      # StoreAdminController Template
      class StoreAdminController < ApplicationController
        before_action :authenticate_store_admin!

        def stores
          render json: current_store_admin.stores
        end

        def foods
          # get only foods on stores that has foods
          render json: current_store_admin.stores.map(&:foods).filter { |foods| !foods.empty? }
        end
      end
    end
  end
end
