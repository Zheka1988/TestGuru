class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  private

  def after_sign_in_path_for(user)
    flash.notice = "Привет, #{current_user.name_with_initial}!"
    user.admin? ? admin_tests_path : tests_path
  end

end
