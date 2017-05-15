class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    logger.warn "Grosse bite wallah"
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sirname, :password, :password_confirmation])
  end

  def access_denied(exception)
    redirect_to '/', alert: exception.message
  end
end
