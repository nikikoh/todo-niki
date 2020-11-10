# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    Users.find_by(name: users)
  end

  # POST /resource
  def create
    Users.find_by(name: users)
  end

  # GET /resource/edit
  def edit
    Users.find_by(name: params[:id])
  end

  # PUT /resource
  def update
    Users.find_by(name: params[:id])
  end

  # DELETE /resource
  def destroy
    Users.find_by(name: params[:id])
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
