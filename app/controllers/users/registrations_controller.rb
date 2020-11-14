# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: %i[new create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.create
    @user.build_profile
    @user.profile.name = @user.user
    @user.save
    redirect_to @user
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

  # アカウント編集後、プロフィール画面に移動する
  def after_update_path_for(_resource)
    user_path(id: current_user.id)
  end
end
