class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = Board.all
  end

  def new
    @board = current_user.board_build(
      content: params[:content]
      user_id: @current_user.id
    )
    @board.save
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
    @board = Board.find(params[:id])
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
    params.require(user).permit(:title, :content)
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def board_build
    Board.new
  end
end
