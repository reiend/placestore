module V2
  module Stores
    # StoreController Template
    class StoreController < ApplicationController
      before_action :authenticate_store_admin!, only: %i[create]
      def create
        store = current_store_admin.stores.create!(create_params)

        render json: {
          status: {
            code: 200,
            message: 'successfully created a store'
          },
          data: store
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

      def find
        store = Store.find(params[:id])

        render json: {
          status: {
            code: 200,
            message: 'successfully find store'
          },
          data: {
            store:,
            foods: store.foods
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
      rescue ActiveRecord::RecordNotFound => e
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

      def list
        stores = Store.all

        render json: {
          status: {
            code: 200,
            message: 'successfully get list of store'
          },
          data: stores
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

      def create_params
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
