class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  attr_accessor :name
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name]
    devise_parameter_sanitizer.permit :account_update, keys: [:name]
    devise_parameter_sanitizer.permit :sign_in, keys: [:name]
  end
end
