class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: %i[show edit update]

  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build(board_params)
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to root_path(@board), notice: '作成しました。'
    else
      flash.now[:error] = '作成に失敗しました。'
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
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
    params.require(:board).permit(:title, :content)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
