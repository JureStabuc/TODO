class ApplicationController < ActionController::Base
	
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:first_name, :last_name, :profile_name, :login, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :current_password) }
  end
end