# frozen_string_literal: true

module Stores
  # FoodController Template
  class FoodController < ApplicationController
    def store_foods
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

    private

    def food_params
      params
        .require(:food)
        .permit(:store_id)
    end
  end
end
