class BoardsController < ApplicationController
  before_action :authenticate_user!
  # set_board = Board.find(params[:id])
  before_action :set_board, only: %i[edit update show destroy]

  def index
    @boards = Board.all
    @board = current_user.id
  end

  def show
    @tasks = @board.tasks
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

  def update
    @boards = current_user.boards.find(params[:id])
    if @baord.update(board_params)
      redirect_to board_path(@baord), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    @boards = board.find(params[:id])
    board.destroy
    redirect_to '/boards', notice: '削除しました。'
  end

  private

  def board_params
    params.require(:board).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
