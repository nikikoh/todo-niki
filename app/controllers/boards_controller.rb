class BoardsController < ApplicationController
  before_action :set_board, only: %i[edit update destroy]
  before_action :authenticate_user!

  def index
    @boards = Board.all.order(created_at: :desc)
  end

  def show; end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to root_path(@board), notice: '作成しました。'
    else
      render :new
    end
  end

  def edit
    # set_board
  end

  def update
    # set_board
    if @board.update(board_params)
      redirect_to root_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    # set_board
    @board.destroy
    redirect_to root_path, notice: '削除しました。'
  end

  private

  def board_params
    params.require(:board).permit(:title,
                                  :content).merge(user_id: current_user.id)
  end

  def set_board
    @board = current_user.boards.find(params[:id])
  end
end
