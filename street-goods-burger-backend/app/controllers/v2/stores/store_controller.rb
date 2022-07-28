module V2
  module Stores
    # FoodController Template
    class StoreController < ApplicationController
      before_action :authenticate_store_admin!, only: [:create]

      def create
        store = current_store_admin.stores.create!(store_params)

        render json: {
          status: {
            code: 200,
            message: 'successfully created a store'
          },
          data: {
            store:
          }
        }
      rescue ActiveRecord::RecordInvalid => e
        render json: {
          status: {
            code: 422,
            message: 'invalid parameters',
            errors: e.message
          }
        }
      rescue ActionController::ParameterMissing => e
        render json: {
          status: {
            code: 400,
            message: 'invalid parameters',
            errors: e.message
          }
        }
      end

      private

      def store_params
        params
          .require(:store)
          .permit(
            :name,
            :line1,
            :line2,
            :postal_code,
            :city,
            :province
          )
      end
    end
  end
end
