class UsersController < ApplicationController
  def index
    @user = User.create!
    if user_signed_in? && current_user.id == @user.id
      render templete: 'boards/index'
    else
      flash.now[:error] = 'ログインに失敗しました'
      redirect_to new_user_registration_path
    end
  end

  def new

  end

  def show
    @user = User.find(params[:id])
  end
end
