class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?
    respond_to :json
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role_id, :family_commissary_id])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password]) 
    end
end
