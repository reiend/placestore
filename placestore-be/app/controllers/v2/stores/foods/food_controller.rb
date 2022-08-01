# frozen_string_literal: true

module V2
  module Stores
    module Foods
      # FoodController Template
      class FoodController < ApplicationController
        before_action :authenticate_store_admin!

        # for viewing foods on store
        def list
          # get store foods according to store_id
          store = Store.find(food_params[:store_id])
          foods = store.foods

          if store.store_admin.email == current_store_admin.email
            render json: {
              status: 200,
              message: 'viewing foods',
              data: {
                store_name: store.name,
                store_admin: current_store_admin.email,
                quantity: foods.length,
                food: {
                  quantity: foods.length,
                  list: foods
                }
              }
            }
          end
        rescue ActiveRecord::RecordNotFound
          render json: {
            status: {
              code: 404,
              message: 'please enter valid params'
            }
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
            status: {
              code: 400,
              message: 'invalid parameters',
              errors: e.message
            }
          }
        end

        # for editing specific food on the store
        # this includes replacing old images on cloudinary
        def update
          food_id = update_food_params[:food_id]
          food_info = update_food_params[:new_food_info]

          name = food_info[:name]
          category = food_info[:category]
          description = food_info[:description]
          price = food_info[:price]
          picture = food_info[:picture]

          update_food_info = current_store_admin
                             .update_food(
                               food_id:,
                               food_info: {
                                 name:,
                                 category:,
                                 description:,
                                 price:,
                                 picture:
                               }
                             )

          render json: update_food_info
        rescue ActionController::ParameterMissing => e
          render json: {
            status: {
              code: 400,
              message: 'invalid parameters',
              errors: e.message
            }
          }
        end

        # for deleting chosen food on the store
        # this doesn't includes deleting images on cloudinary
        def destroy
          food_id = remove_food_params[:food_id]
          remove_food_info = current_store_admin.remove_food(food_id:)

          render json: remove_food_info
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

        def food_params
          params
            .require(:food_info)
            .permit(:store_id)
        end

        def add_new_food_params
          params
            .require(:food)
            .permit(
              :name,
              :category,
              :description,
              :price,
              :store_id,
              :picture
            )
        end

        def update_food_params
          params
            .require(:food_info)
            .permit(
              :food_id,
              { new_food_info: %i[name category description price picture] }
            )
        end

        def remove_food_params
          params
            .require(:food_info)
            .permit(
              :food_id
            )
        end
      end
    end
  end
end
