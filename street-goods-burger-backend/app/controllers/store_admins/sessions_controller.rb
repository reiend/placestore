# frozen_string_literal: true

class StoreAdmins::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Logged in sucessfully.' },
      data: StoreAdminCustomerSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    unless current_user
      render json: {
        status: 200,
        message: 'signout out successfully'
      }, status: :ok
      return nil
    end
    render json: {
      status: 401,
      message: "Couldn't find an active session."
    }, status: :unauthorized
  end
end
