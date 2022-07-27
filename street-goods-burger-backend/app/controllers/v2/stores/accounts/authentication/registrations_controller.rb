# frozen_string_literal: true

module V2
  module Stores
    module Accounts
      module Authentication
        class RegistrationsController < Devise::RegistrationsController
          respond_to :json

          private

          def respond_with(resource, _opts = {})
            if resource.persisted?
              render json: {
                status: { code: 200, message: 'signup successfully.' },
                data: StoreAdminSerializer.new(resource).serializable_hash[:data][:attributes]
              }
            else
              errors = resource.errors.full_messages.to_sentence
              render json: {
                status: {
                  message: "account couldn't be created successfully. #{errors}"
                }
              }, status: :unprocessable_entity
            end
          end
        end
      end
    end
  end
end
