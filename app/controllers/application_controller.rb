class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(devise_required) }
    devise_parameter_sanitizer.for(:account_update){ |u| u.permit(devise_update_required) }
  end

  def devise_required
    [
      :email,
      :password,
      :first_name,
      :last_name
    ]
  end

  def devise_update_required
    [
      :email,
      :current_password,
      :first_name,
      :last_name,
      :favourite_team
    ]
  end
end
