class UsersController < ApplicationController
  def index
    @user = User.all
  end

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
end
