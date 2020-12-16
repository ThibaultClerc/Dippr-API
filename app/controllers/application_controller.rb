class ApplicationController < ActionController::API
  respond_to :json

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    if current_user.present? && current_user.is_admin == true
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :city , :is_admin ,:street ,:country ,:zip_code ,:description , :dippers, :user_rating, :phone_number])
    else
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :city ,:street ,:country ,:zip_code ,:description , :dippers , :phone_number])
    end
  end
end
