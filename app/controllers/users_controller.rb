class UsersController < ApplicationController
  def new
    @user = User.new
    @user = User.save
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create
    @user = User.save
  end

  def index; end
end
