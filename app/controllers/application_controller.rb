class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user, :user_signed_in

  attr_accessor :name
  protect_from_forgery with: :exception

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def user_signed_in
    !current_user.nil
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up,        keys: [:name]
    devise_parameter_sanitizer.permit :account_update, keys: [:name]
    devise_parameter_sanitizer.permit :sign_in,        keys: [:name]
  end
end
