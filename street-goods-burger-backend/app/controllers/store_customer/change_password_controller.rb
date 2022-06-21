# frozen_string_literal: true

# ChangePasswordController Template
class StoreCustomer::ChangePasswordController < StoreCustomer::StoreCustomerController
  def update
    new_password = change_password_params[:new_password]
    new_password_confirmation = change_password_params[:new_password_confirmation]
    change_password_info = current_store_customer
                           .change_password(
                             password: {
                               new_password:,
                               new_password_confirmation:
                             }
                           )
    render json: change_password_info
  rescue ActionController::ParameterMissing => e
    render json: {
      status: 400,
      message: 'invalid parameters',
      errors: e.message
    }
  end

  private

  def change_password_params
    params
      .require(:change_password_info)
      .permit(
        :new_password,
        :new_password_confirmation
      )
  end
end
