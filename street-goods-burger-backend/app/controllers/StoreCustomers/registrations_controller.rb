# frozen_string_literal: true

# StoreCustomer Template
class StoreCustomers::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up sucessfully.' },
        data: StoreCustomerSerializer.new(resource).serializable_hash[:data][:attributes]
      }
    else
      errors = resource.errors.full_messages.to_sentence
      render json: {
        status: {
          message: "Store customer account couldn't be created successfully. #{errors}"
        }
      }, status: :unprocessable_entity
    end
  end
end
