class BoardsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_board, only: %i[show edit update]

  def index
    @boards = Board.all
    if @boards
      @board
    else
      :new
    end
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(
      user_id: @current_user.id
    )
    if @board.save
      redirect_to board_path(@board), notice: '作成しました。'
    else
      flash.now[:error] = '作成に失敗しました。'
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
    @user = User.find(@board.user_id)
  end

  def update
    @board = board.find(params[:id])
    @board.save
    redirect_to '/boards', notice: '更新しました。'
  end

  def destroy
    @board = board.find(params[:id])
    board.destroy
    redirect_to '/boards', notice: '削除しました。'
  end

  private

  def board_params
    params.require(:board).permit(:id, :title, :content)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
