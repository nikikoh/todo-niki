class UsersController < ApplicationController
  def new; end

  def show
    @user = User.find(params[:id])
  end

  def create
    @users = current_user.articles.build(users_params)
  end
end
