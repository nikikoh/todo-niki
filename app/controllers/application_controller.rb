class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

   # ログイン後、blogs/indexに移動する
  def after_sign_in_path_for(_resource)
    tasks_index_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name]
    devise_parameter_sanitizer.permit :account_update, keys: %i[name profile]
    devise_parameter_sanitizer.permit :sign_in, keys: [:name]
  end
end
