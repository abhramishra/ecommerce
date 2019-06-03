class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameter, if: :devise_controller?
	
	rescue_from CanCan::AccessDenied do 
		redirect_to root_path, notice: "The page you are looking for does not exist"
		
	end

	protected

	def configure_permitted_parameter
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:mobile])
	end
end
