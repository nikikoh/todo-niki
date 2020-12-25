class BoardsController < ApplicationController
  before_action :set_board, only: %i[ edit update destroy]
  before_action :authenticate_user!

  def index
    @boards = Board.all
    @tasks = Task.all
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

  def edit
    
  end

  def update
    if @board.update(board_params)
      redirect_to root_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  def destroy
    @board.destroy
    redirect_to root_path, notice: '削除しました。'
  end

  private

  def board_params
    params.require(:board).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
