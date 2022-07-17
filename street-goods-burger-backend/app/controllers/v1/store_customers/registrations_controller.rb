# frozen_string_literal: true

# StoreCustomer Template
class StoreCustomers::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  # create store customer account under the first seeded store store
  def create
    store_customer = Store.first.store_customers.create(store_customer_account_params)
    respond_with store_customer
  end

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

  def store_customer_account_params
    params
      .require(:store_customer)
      .permit(
        :first_name,
        :last_name,
        :email,
        :password
      )
  end
end
