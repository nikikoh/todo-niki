class BoardsController < ApplicationController
  before_action :set_board, only: [:show]

  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def create
    board = Board.new
    if board.save
      redirect_to '/boards', notice: '作成しました。'
    else
      flash.now[:error] = '作成に失敗しました。'
      render action: :new
    end
  end

  def show
    @board = Board.find(params[id])
  end

  def update
    id    = params[:id]
    board = board.find(id)
    board.save
    redirect_to '/boards', notice: '更新しました。'
  end

  def destroy
    board = board.find(params[:id])
    board.destroy
    redirect_to '/boards', notice: '削除しました。'
  end

  private

  def board_params
    params.require.permit(:board, params[:id])
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def board_build
    Board.new
  end
end
