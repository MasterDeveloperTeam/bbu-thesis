class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :update_sanitized_params, if: :devise_controller?
  protect_from_forgery with: :exception
private
	def update_sanitized_params
	  devise_parameter_sanitizer.for(:sign_up)  << [:email, :password, :password_confirmation]
	end
end
