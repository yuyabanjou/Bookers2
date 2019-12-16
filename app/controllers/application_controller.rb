class ApplicationController < ActionController::Base
# 下記を追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
