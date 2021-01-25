class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate
  helper_method :logged_in?, :current_studio

  protected

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name profile image])
    elsif resource_class == Studio
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name address postal_code])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[email name address postal_code image])
    else
      super
    end
  end


  def logged_in?
    !!current_studio
  end

  # def current_studio
  #   return unless session[:current_studio]
  #
  #   @current_studio ||= Studio.find(session[:studio_id])
  # end

  def authenticate
    return if logged_in?

    redirect_to root_path, alert: 'ログインしてください'
  end

end
