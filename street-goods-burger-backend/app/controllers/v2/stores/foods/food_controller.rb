# frozen_string_literal: true

module V2
  module Stores
    module Foods
      # FoodController Template
      class FoodController < StoreController
        before_action :authenticate_store_admin!

        # for creating new food for the store
        # this includes uploading images after creating on cloudinary
        include Food::Create

        # for editing current food on the store
        # this includes replacing old images on cloudinary
        include Food::Update
      end
    end
  end
end
