# frozen_string_literal: true

module V2
  module Stores
    module Foods
      # FoodController Template
      class FoodController < StoreController
        before_action :authenticate_store_admin!, except: [:index]

        # for viewing foods on store
        include Food::Show

        # for creating new food for the store
        # this includes uploading images after creating on cloudinary
        include Food::Create
      end
    end
  end
end
