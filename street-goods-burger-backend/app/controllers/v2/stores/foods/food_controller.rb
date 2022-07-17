# frozen_string_literal: true

module V2
  module Stores
    module Foods
      # FoodController Template
      class FoodController < StoreController
        before_action :authenticate_store_admin!, except: [:index]

        # for viewing foods on store
        def index
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

        # for creating new food for the store
        # this includes uploading images after creating on cloudinary
        def create
          food_info = add_new_food_params

          add_new_food_info = current_store_admin
                              .add_new_food(food_info:)

          render json: add_new_food_info
        rescue ActionController::ParameterMissing => e
          render json: {
            status: 400,
            message: 'invalid parameters',
            errors: e.message
          }
        end

        private

        def food_params
          params
            .require(:food)
            .permit(:store_id)
        end

        def add_new_food_params
          params
            .require(:food_info)
            .permit(
              :name,
              :category,
              :description,
              :price,
              :picture
            )
        end
      end
    end
  end
end
