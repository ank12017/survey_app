class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password, :password_confirmation,:admin])
  end

  def after_sign_in_path_for(resource)
      if  resource.admin?
     	surveys_path
      else
     	test_surveys_path
      end
  end
end
