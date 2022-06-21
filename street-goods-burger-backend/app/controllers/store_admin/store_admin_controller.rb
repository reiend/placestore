# frozen_string_literal: true

# StoreAdmin::StoreAdminController Template
class StoreAdmin::StoreAdminController < ApplicationController
  before_action :authenticate_store_admin!
end
