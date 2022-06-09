# frozen_string_literal: true

# ApplicationController Template
class ApplicationController < ActionController::API
  before_action :configure_permitted_paramaters, if: :devise_controller?

  private

  def configure_permitted_paramaterso
    devise_parameter_sanitizer
      .permit(
        :sign_up,
        keys: %i[first_name last_name]
      )
  end
end
