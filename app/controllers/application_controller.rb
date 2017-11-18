class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def can_administer?
  	:ture
 ##     current_user.try(:admin?)
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:country, :birthdate, :email, :password, :password_confirmation, :avatar, :avatar_cache, :remove_avatar ])
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:name,:country, :birthdate, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar])
  end
end
