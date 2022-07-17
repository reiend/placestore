# frozen_string_literal: true

class StoreCustomers::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Logged in sucessfully.' },
      data: StoreCustomerSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    render json: {
      status: 200,
      message: 'signout out successfully'
    }, status: :ok
  end
end
