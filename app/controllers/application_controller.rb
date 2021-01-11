class ApplicationController < ActionController::Base 
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    elsif resource_class == Studio
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    else
      super
    end
  end
end
