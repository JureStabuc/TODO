class ApplicationController < ActionController::Base

	before_filter :update_sanitized_params, if: :devise_controller?


  protected

	def update_sanitized_params
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :remember_me) }
   	  devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:first_name, :last_name, :profile_name, :login, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :current_password) }
	end

	def user_params
      params.require(:user).permit(:avatar)
    end
end