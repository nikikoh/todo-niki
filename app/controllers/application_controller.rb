class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  attr_accessor :name

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[name password password_confirmation]
    devise_parameter_sanitizer.permit :sign_in, keys: %i[name password]
  end
end
