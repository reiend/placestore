module V2
  module Stores
    # FoodController Template
    class StoreController < ApplicationController
      # for viewing foods on store
      include Food::List
    end
  end
end
