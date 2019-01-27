class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def user_not_authorized
    # flash[:alert] = "You are not authorized to perform this action"
    redirect_to root_path, alert: "You are not authorized to perform this action"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
