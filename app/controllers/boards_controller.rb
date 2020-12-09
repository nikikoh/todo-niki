class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save!
      redirect_to root_path(@board), notice: '作成しました。'
    else
      flash.now[:error] = '作成に失敗しました。'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to root_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  def destroy
    Board.find(params[:id]).destroy
    redirect_to root_path, notice: '削除しました。'
  end

  private

  def board_params
    params.require(:board).permit(:title, :content).merge(user_id: current_user.id, board_id: Board.id)
  end
end
