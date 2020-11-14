class BoardsController < ApplicationController
  def index
    @boards = Board.order(:limit_date).all
    @state = %w[TODO DOING FINISH]
  end

  def store
    board = Board.new
    board.board      = params[:board]
    board.state      = params[:state]
    board.limit_date = params[:limit_date]
    board.save
    redirect_to '/boards', notice: 'ボードを作成しました。'
  end

  def show
    id = params[:id]
    @board = Board.find(id)
    @status = %w[todo doing done]
  end

  def update
    id = params[:id]
    board = board.find(id)

    board.board        = params[:board]
    board.state        = params[:state]
    board.limit_date   = params[:limit_date]
    board.save

    redirect_to '/boards', notice: 'ボードを更新しました。'
  end

  def destroy
    board = board.find(params[:id])
    board.destroy
    redirect_to '/boards', notice: 'ボードを削除しました'
  end
end
